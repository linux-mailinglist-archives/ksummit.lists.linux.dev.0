Return-Path: <ksummit+bounces-127-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8030A3688A5
	for <lists@lfdr.de>; Thu, 22 Apr 2021 23:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id E43223E8D6E
	for <lists@lfdr.de>; Thu, 22 Apr 2021 21:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507332FA6;
	Thu, 22 Apr 2021 21:37:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0912FA2
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 21:37:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2657EAF4E;
	Thu, 22 Apr 2021 21:36:56 +0000 (UTC)
Date: Thu, 22 Apr 2021 23:36:55 +0200 (CEST)
From: Jiri Kosina <jkosina@suse.cz>
To: Thomas Gleixner <tglx@linutronix.de>
cc: Bart Van Assche <bvanassche@acm.org>, 
    James Bottomley <James.Bottomley@HansenPartnership.com>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <8735vixb73.ffs@nanos.tec.linutronix.de>
Message-ID: <nycvar.YFH.7.76.2104222334290.18270@cbobk.fhfr.pm>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210422123559.1dc647fb@coco.lan> <0d83502f-eb29-9b06-ada8-fcd03f9c87a8@linuxfoundation.org> <a72a13e56ee5f19b0dee9ae8c1928b020e8809c2.camel@HansenPartnership.com>
 <f3c4cb63-f0f7-97be-227a-7a1a0db34650@acm.org> <nycvar.YFH.7.76.2104221959370.18270@cbobk.fhfr.pm> <8735vixb73.ffs@nanos.tec.linutronix.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Apr 2021, Thomas Gleixner wrote:

> >> I'm not convinced that sending trivial patches to a separate mailing 
> >> list and maintainer helps everyone. As an example, I want to see block 
> >> layer patches being posted on the block layer mailing list and I want to 
> >> see SCSI patches being posted on the SCSI mailing list. I don't want to 
> >> have to follow a separate "trivial" mailing list to verify whether or 
> >> not e.g. a patch is posted on that mailing list that changes a correct 
> >> comment into an incorrect comment.
> >
> > Most of the patches have usually been of a 'fix typo in english wording in 
> > a comment / printk()' nature.
> 
> But even that typo muck creates conflicts which are not necessary at
> all. So yes, that trivial thing should just die.
> 
> It seemed to be a good idea long ago ...

Yeah, the tools for applying patches have improved since then a little bit 
:), so it's not really saving time of anyone any longer (even if it was 
actually functional, which it's not).

I'll remove it for 5.13 from Documentation/ and MAINTAINERS unless anybody 
comes up with a very good reason for keeping it. Which I doubt.

Thanks,

-- 
Jiri Kosina
SUSE Labs

