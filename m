Return-Path: <ksummit+bounces-688-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6C55784C
	for <lists@lfdr.de>; Thu, 23 Jun 2022 12:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39ED0280C1D
	for <lists@lfdr.de>; Thu, 23 Jun 2022 10:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234D41C2F;
	Thu, 23 Jun 2022 10:59:13 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390181876
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 10:59:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C38038F;
	Thu, 23 Jun 2022 12:59:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655981941;
	bh=UQU+DjsTxYSNbp0numsizpMD/FUtWfY5frG9n7w5RlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkO+5PB+Uska/wDIfHh+RTq/ZCMLphoHB/GSQpVUCOQiSEYqAUq2P90GSCOnhoIsq
	 UvMCHLGGSEYv11htgin5s+PWShXys3W7P30at5GYRBmP83lKepvc8I8nLxRXejUy/S
	 Ckw9qR8sfS0fbO4CAmBTAohQMeI/+WfzNNaDAMAE=
Date: Thu, 23 Jun 2022 13:58:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Christoph Hellwig <hch@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>
Subject: [TECH TOPIC] Why is devm_kzalloc() harmful and what can we do about
 it
Message-ID: <YrRHZlcwqPChB/Yt@pendragon.ideasonboard.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
 <20220621151122.GL16517@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621151122.GL16517@kadam>

On Tue, Jun 21, 2022 at 06:11:22PM +0300, Dan Carpenter wrote:
> On Sun, Jun 19, 2022 at 04:49:18PM +0300, Laurent Pinchart wrote:
> > Writing rust code that compiles (without wrapping everything in unsafe)
> > requires understanding of life time management of objects. This is also
> > required to write safe C code, but as can be seen through the kernel
> > it's more often that not completely ignored, especially in drivers (just
> > look at how many drivers that expose a chardev to userspace are happy
> > using devm_kzalloc() to allocate their private data structure that is
> > accessible through userspace calls). It may be caused by a combination
> > of both the compiler an the kernel allowing bad practices (the fact that
> > devm_kzalloc() exists without a huge flashing red warning around it
> > shows that we either don't understand the problem or don't care),
> 
> The answer is that we don't understand the problem.  I've been vaguely
> aware that there is a problem related to this but I've never been clear
> enough to the point where I could actually tell if code is buggy.
> 
> It sounds like something which could probably be detected with static
> analysis.  Most of the static analysis devs hang out on kernel-janitors
> so if you see a bug and you think it might happen more than once then
> send an email to kernel-janitors@vger.kernel.org.
> 
> Sometimes if we look at a patch then maybe we can identify several
> heuristics to spot the bug.

Sounds like this could be a worth a dedicated discussion at the kernel
summit ?


devm_kzalloc() has been introduced more than 15 years ago and has
steadily grown in usage through the kernel sources (more than 6000 calls
and counting). While it has helped lowering the number of memory leaks,
it is not the magic tool that many seem to think it is.

The devres family of functions tie the lifetime of the resources they
allocate to the lifetime of a struct device bind to a driver. This is
the right thing to do for many resources, for instance MMIO or
interrupts need to be released when the device is unbound from its
driver at the latest, and the corresponding devm_* helpers ensure this.
However, drivers that expose resources to userspace have, in many cases,
to ensure that those resources can be safely accessed after the device
is unbound from its driver. A particular example is character device
nodes, which userspace can keep open and close after the device has been
unbound from the driver. If the memory region that stores the struct
cdev instance is allocated by devm_kzalloc(), it will be freed before
the file release handler gets to run.

Most kernel developers are not aware of this issue that affects an ever
growing number of drivers. The problem has been discussed in the past
([1], [2]) - interestingly in the context of Kernel Summit proposals,
but never scheduled there - but never addressed.

This talk proposal aims at raising awareness of the problem, present a
possible solution that has been proposed as an RFC ([3]), and discuss
what we can do to solve the issue. Solutions at the technical, community
and process levels will be discussed, as addressing the devm_kzalloc()
hamr also requires a plan to teach the kernel community and catch new
offending code when it gets submitted.

[1] https://lore.kernel.org/all/2111196.TG1k3f53YQ@avalon/
[2] https://lore.kernel.org/all/YOagA4bgdGYos5aa@kroah.com/
[3] https://lore.kernel.org/linux-media/20171116003349.19235-1-laurent.pinchart+renesas@ideasonboard.com/

-- 
Regards,

Laurent Pinchart

