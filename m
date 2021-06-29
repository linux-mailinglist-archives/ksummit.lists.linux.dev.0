Return-Path: <ksummit+bounces-233-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE5B3B7487
	for <lists@lfdr.de>; Tue, 29 Jun 2021 16:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id D8B313E0FA0
	for <lists@lfdr.de>; Tue, 29 Jun 2021 14:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389BB2FB7;
	Tue, 29 Jun 2021 14:40:55 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF4617F
	for <ksummit@lists.linux.dev>; Tue, 29 Jun 2021 14:40:53 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id b5so21030834ilc.12
        for <ksummit@lists.linux.dev>; Tue, 29 Jun 2021 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j6Jy3rLTG2CN/RogDKDnP8ljDvaOsXTLo2NCL3MVQIw=;
        b=IthAjXN50DwraszkV0dnjbMjnSQO9gvxd+jmPw/h+fNN6RXb3Pku7aW7VbwJEf4X9P
         DBwp9YX/0lrC0iOf9pmMeJ+QynzY8ZT4I3TtxD97zfAF9Gj1619OcjLBHhsPQ8Sru43K
         dgv59K7sfGiqB29ZMX1OyEkvo0Mznb9ossrpR/Gy0qxjFUYOUwpjUGV150lL8ClIEwTM
         ArFtSPqgPgl2KAnEr1/cBxepopA1GjYKCI1jD0khMYgTHvItpamRE28GOh/xQF2w7421
         FL+QPz41iIHDGWPHE+KZFnAXtb55vHVWBWo9UlcYJU3ygj5dr4YREL5hfMqj2TFdQ1yl
         20yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j6Jy3rLTG2CN/RogDKDnP8ljDvaOsXTLo2NCL3MVQIw=;
        b=UmTdBDkp4RieCBdPhv/LC83BazQgng1N5m2Wl69WeB7j86aHS/1920cWg4ozqOPzY2
         ZEmWtBf5h/mjOt3NIIZSUBUEvjiufGGTq11T3Hr7EXi8Ju2w6Iqo4nlHAO4/+eKZ04bC
         tO8tPhqSEU1FmEtWFlUZJ9gwmBf77I7JXykm08dgz+ah30uJ09ryp/RCFAs0gx0CmQii
         wsEiJqlgAL5GOgmpFy+aPC88dIRV5KNVHPSRklmGs4sz9ALMQntCk8qeaDl25DmawnSf
         BPbLA0DKCvYcwYU24suFtMGiGG21apAEaxjsAdu0zMmzyJLc3CBo0al92EGV1Ap+UjRN
         Nddw==
X-Gm-Message-State: AOAM533FduaKrUyVPReKYXKGzUPnyQCcUoZcel1qMnjbAcbCl0Mw5MzQ
	N7kSebllzH0nEq4CSNEQ1gXhJdza/KWSJYZURKs=
X-Google-Smtp-Source: ABdhPJwA79LYYLtbs2fLxpxiwW7/WXYL1Uf4arukt3KDi6BhOlnFWxQmiYLcplaMn0yuO7r7+5Vxo55JnDWttc7MjR8=
X-Received: by 2002:a05:6e02:4a1:: with SMTP id e1mr21813303ils.133.1624977652950;
 Tue, 29 Jun 2021 07:40:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHqX9vZ_F4p0J_E3DZ4eoW0d3J2dZET5GEbM4Gr5wkUdRRPsAQ@mail.gmail.com>
 <effe01f3-ddf9-64f8-da96-61bb82bfabc9@acm.org> <de903dcd41f8881a103a8ca955347b0ef4f176f3.camel@HansenPartnership.com>
In-Reply-To: <de903dcd41f8881a103a8ca955347b0ef4f176f3.camel@HansenPartnership.com>
From: Selva Jove <selvajove@gmail.com>
Date: Tue, 29 Jun 2021 20:10:41 +0530
Message-ID: <CAHqX9vaCHXKi9fnE7pbTNpavo511QwuZ=6j68xC_Jr9csn3LWw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Settling Copy Offload via NVMe SCC
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Bart Van Assche <bvanassche@acm.org>, ksummit@lists.linux.dev, joshiiitr@gmail.com, 
	nitheshshetty@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Bart and James,

Thanks for the heads up.
LSF/MM is a fine idea for the topic. It's just that we had a bit of uncertainty
about in-person event and December felt somewhat distant. So we thought
of making some progress by posting this to LPC.

Thanks,
Selva & Nitesh

On Fri, Jun 25, 2021 at 9:38 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Fri, 2021-06-25 at 09:02 -0700, Bart Van Assche wrote:
> > On 6/25/21 7:47 AM, Selva Jove wrote:
> > > The de-facto way of copying data in I/O stack has been pulling it
> > > from one location followed by pushing to another. The farther the
> > > application, requiring copy, is from storage, the longer it takes
> > > for the trip to be over. With copy-offload the trips get shorter as
> > > the storage device presents an interface to do internal data-
> > > copying.  This enables the host to optimise the pull-and-push
> > > method, freeing up the host CPU, RAM and the fabric elements.
> > >
> > > The copy-offload interface has existed in SCSI storage for at least
> > > a decade through XCOPY but faced insurmountable challenges in
> > > getting into the Linux I/O stack. As for NVMe storage, copy-offload
> > > made its way into the main specification with a new Simple Copy
> > > Command(SCC) recently. This has stimulated a renewed interest and
> > > efforts towards copy-offload in the Linux community.
> > >
> > > In this talk, we speak of the upstream efforts that we are doing
> > > around SCC -
> > > https://lore.kernel.org/linux-nvme/20210219124517.79359-1-selvakuma.s1@samsung.com/#r
> > >
> > > We'd extensively cover the design-decisions and seek the feedback
> > > on the plumbing aspects such as -
> > >
> > > 1. User-interface. Should it be a new ioctl/syscall, io_uring based
> > > opcode or must it fit into existing syscalls such as
> > > copy_file_range.
> > > 2. The transport mode between block-layer and NVMe. A chain of
> > > empty bios (like discard) vs bio with payload.
> > > 3. Must SCSI XCOPY compatibility be considered while we go about
> > > building interfaces around NVMe SCC?
> > > 4. Feasibility and challenges for in-kernel use cases, including
> > > the file-systems and device-mappers
> >
> > This topic seems closely related to "Storage: Copy Offload"
> > (
> > https://lore.kernel.org/linux-block/BYAPR04MB49652C4B75E38F3716F3C06386539@BYAPR04MB4965.namprd04.prod.outlook.com/
> > ).
>
> Not only that but it would seem to be better suited for LSF/MM on the
> IO track than the kernel summit track of Plumbers:
>
> https://lore.kernel.org/bpf/60ca126b.1c69fb81.90af4.93a7@mx.google.com/
>
> Since the plumbing aspects are more how would current practitioners use
> the API and how might we plumb it into filesystems.
>
> James
>
>
> > Notes about implementing copy offloading are available at
> > https://github.com/bvanassche/linux-kernel-copy-offload.
> >
> > Thanks,
> >
> > Bart.
> >
>
>

