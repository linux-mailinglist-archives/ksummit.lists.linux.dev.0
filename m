Return-Path: <ksummit+bounces-118-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934FE368654
	for <lists@lfdr.de>; Thu, 22 Apr 2021 20:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8ADBE1C6B52
	for <lists@lfdr.de>; Thu, 22 Apr 2021 18:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB192FA2;
	Thu, 22 Apr 2021 18:03:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AEF2F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 18:03:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C1C87AE27;
	Thu, 22 Apr 2021 18:03:39 +0000 (UTC)
Date: Thu, 22 Apr 2021 20:03:39 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Bart Van Assche <bvanassche@acm.org>
cc: James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <f3c4cb63-f0f7-97be-227a-7a1a0db34650@acm.org>
Message-ID: <nycvar.YFH.7.76.2104221959370.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210422123559.1dc647fb@coco.lan> <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org> <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <f3c4cb63-f0f7-97be-227a-7a1a0db34650@acm.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Apr 2021, Bart Van Assche wrote:

> Why was the trivial tree introduced? I may be missing some history here.

The idea (some time in the stone age, way before I took it over), IIRC, 
was that trivial patches are eating up cycles of maintainers that could be 
spent in better way.

This reasoning is completely moot now of course, as I myself don't have 
time for taking care of that tree any more for quite some time already.

Earth would definitely not stop rotating if we nuke any mentions of 
trivial@ from the Documentation/ altogether.

> I'm not convinced that sending trivial patches to a separate mailing 
> list and maintainer helps everyone. As an example, I want to see block 
> layer patches being posted on the block layer mailing list and I want to 
> see SCSI patches being posted on the SCSI mailing list. I don't want to 
> have to follow a separate "trivial" mailing list to verify whether or 
> not e.g. a patch is posted on that mailing list that changes a correct 
> comment into an incorrect comment.

Most of the patches have usually been of a 'fix typo in english wording in 
a comment / printk()' nature.

-- 
Jiri Kosina
SUSE Labs

