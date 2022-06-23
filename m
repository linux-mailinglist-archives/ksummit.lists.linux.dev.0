Return-Path: <ksummit+bounces-690-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E51E5578B9
	for <lists@lfdr.de>; Thu, 23 Jun 2022 13:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 346AA2E0A7B
	for <lists@lfdr.de>; Thu, 23 Jun 2022 11:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1138E1C2F;
	Thu, 23 Jun 2022 11:31:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C71876
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 11:31:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E898DD;
	Thu, 23 Jun 2022 13:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655983876;
	bh=lnlQ2sCUmhXIZJWHMy0lHgKwGGc9sHsLCnw0JWe9r7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IutopdmiR+734WcVFq2CTbPkiM4YczcPRmhnEC0vo6+G1DcLJyjte3ib6SPZ8di5l
	 hqc7huzSQgz591YpnMx82UpXBNX8wTDyCHZJBOZz2RGjO2YrFnc+KODKZVklCoi6Ii
	 k9Z76JM5KIh1uQ5n9PMFvhje36sUX+CLV1gJjn+U=
Date: Thu, 23 Jun 2022 14:31:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Christoph Hellwig <hch@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [TECH TOPIC] Why is devm_kzalloc() harmful and what can we do
 about it
Message-ID: <YrRO9bszgBnGl/r3@pendragon.ideasonboard.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com>
 <20220621151122.GL16517@kadam>
 <YrRHZlcwqPChB/Yt@pendragon.ideasonboard.com>
 <20220623112422.GE11460@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220623112422.GE11460@kadam>

Hi Dan,

On Thu, Jun 23, 2022 at 02:24:22PM +0300, Dan Carpenter wrote:
> On Thu, Jun 23, 2022 at 01:58:46PM +0300, Laurent Pinchart wrote:
> > The devres family of functions tie the lifetime of the resources they
> > allocate to the lifetime of a struct device bind to a driver. This is
> > the right thing to do for many resources, for instance MMIO or
> > interrupts need to be released when the device is unbound from its
> > driver at the latest, and the corresponding devm_* helpers ensure this.
> > However, drivers that expose resources to userspace have, in many cases,
> > to ensure that those resources can be safely accessed after the device
> > is unbound from its driver. A particular example is character device
> > nodes, which userspace can keep open and close after the device has been
> > unbound from the driver. If the memory region that stores the struct
> > cdev instance is allocated by devm_kzalloc(), it will be freed before
> > the file release handler gets to run.
> 
> This is a good general description of the problem, but it's not specific
> enough for me to write a checker rule.  What I basically need is a patch
> I guess, and then I could try write a checker rule for that exact code.
> 
> If your RFC patch were merged then the problem would be solved?

A new version of the RFC is needed, I'll try to work on that "soon".
Merging it will then solve part of the problem (races between userspace
calls and device unbind), but not the full problem (lifetime of objects
that can be accessed through the file descriptor release), and in V4L2
only.

The race condition fix should really move to the cdev level in my
opinion. For the lifetime management issue, we will need something else.

-- 
Regards,

Laurent Pinchart

