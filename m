Return-Path: <ksummit+bounces-229-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2797A3B4735
	for <lists@lfdr.de>; Fri, 25 Jun 2021 18:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D7DA01C0DD7
	for <lists@lfdr.de>; Fri, 25 Jun 2021 16:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0854D6D11;
	Fri, 25 Jun 2021 16:08:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8815B2FB3
	for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 16:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 202F91280FF4;
	Fri, 25 Jun 2021 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1624637311;
	bh=CSA642psqcBrdVWPVz6v5RgLVmxViVx70HfoXy9sbLA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=hq7u22pxtNfTtwAESvwhPZzoBaW2MTupIWrEKU1QmKRWOV/p2yTtaiZO13xgaFHRz
	 b/T47dCCpYXJ5n48h+1LHocbqTKupKytn9La0WHer/N6VMIjX+JMajtBR34kvG5Jcj
	 3QdOwNq9ThqlGFZYzr7sWFVNPr5WQIhhpf/mpUE4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dEeKZO70lybA; Fri, 25 Jun 2021 09:08:31 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id AB1BB1280FF3;
	Fri, 25 Jun 2021 09:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1624637310;
	bh=CSA642psqcBrdVWPVz6v5RgLVmxViVx70HfoXy9sbLA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=kZNQ79O5oQS+eWEP/JbbJhJ3rIFwdkJICOh/CWFUvr/+C2Iy84j7zpasxmXzsEUHA
	 Rl4zFDorKSXafMC4AS88DojOOSffXrIe2/JBCwEP+T/F6UytfSFRLkbEX9GeRpqOWH
	 6ggsFAciEqZLVchwPIRCcYsFliRlY9zdENpFauOo=
Message-ID: <de903dcd41f8881a103a8ca955347b0ef4f176f3.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Settling Copy Offload via NVMe SCC
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Bart Van Assche <bvanassche@acm.org>, Selva Jove <selvajove@gmail.com>, 
	ksummit@lists.linux.dev
Cc: joshiiitr@gmail.com, nitheshshetty@gmail.com
Date: Fri, 25 Jun 2021 09:08:29 -0700
In-Reply-To: <effe01f3-ddf9-64f8-da96-61bb82bfabc9@acm.org>
References: 
	<CAHqX9vZ_F4p0J_E3DZ4eoW0d3J2dZET5GEbM4Gr5wkUdRRPsAQ@mail.gmail.com>
	 <effe01f3-ddf9-64f8-da96-61bb82bfabc9@acm.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-25 at 09:02 -0700, Bart Van Assche wrote:
> On 6/25/21 7:47 AM, Selva Jove wrote:
> > The de-facto way of copying data in I/O stack has been pulling it
> > from one location followed by pushing to another. The farther the
> > application, requiring copy, is from storage, the longer it takes
> > for the trip to be over. With copy-offload the trips get shorter as
> > the storage device presents an interface to do internal data-
> > copying.  This enables the host to optimise the pull-and-push
> > method, freeing up the host CPU, RAM and the fabric elements.
> > 
> > The copy-offload interface has existed in SCSI storage for at least
> > a decade through XCOPY but faced insurmountable challenges in
> > getting into the Linux I/O stack. As for NVMe storage, copy-offload 
> > made its way into the main specification with a new Simple Copy
> > Command(SCC) recently. This has stimulated a renewed interest and
> > efforts towards copy-offload in the Linux community.
> > 
> > In this talk, we speak of the upstream efforts that we are doing
> > around SCC -
> > https://lore.kernel.org/linux-nvme/20210219124517.79359-1-selvakuma.s1@samsung.com/#r
> > 
> > We'd extensively cover the design-decisions and seek the feedback
> > on the plumbing aspects such as -
> > 
> > 1. User-interface. Should it be a new ioctl/syscall, io_uring based
> > opcode or must it fit into existing syscalls such as
> > copy_file_range. 
> > 2. The transport mode between block-layer and NVMe. A chain of
> > empty bios (like discard) vs bio with payload.
> > 3. Must SCSI XCOPY compatibility be considered while we go about
> > building interfaces around NVMe SCC?
> > 4. Feasibility and challenges for in-kernel use cases, including
> > the file-systems and device-mappers
> 
> This topic seems closely related to "Storage: Copy Offload"
> (
> https://lore.kernel.org/linux-block/BYAPR04MB49652C4B75E38F3716F3C06386539@BYAPR04MB4965.namprd04.prod.outlook.com/
> ).

Not only that but it would seem to be better suited for LSF/MM on the
IO track than the kernel summit track of Plumbers:

https://lore.kernel.org/bpf/60ca126b.1c69fb81.90af4.93a7@mx.google.com/

Since the plumbing aspects are more how would current practitioners use
the API and how might we plumb it into filesystems.

James


> Notes about implementing copy offloading are available at
> https://github.com/bvanassche/linux-kernel-copy-offload.
> 
> Thanks,
> 
> Bart.
> 



