Return-Path: <ksummit+bounces-355-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965143C19D2
	for <lists@lfdr.de>; Thu,  8 Jul 2021 21:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 4CC123E10AB
	for <lists@lfdr.de>; Thu,  8 Jul 2021 19:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73C32F80;
	Thu,  8 Jul 2021 19:31:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937E168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 19:31:21 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id n11so4336084pjo.1
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=ahrM/t7BsqM+6RX3lL1WaHO29T0hW2ebTFEhSI/qU/M=;
        b=BMxDEhYk27YtafKZ6zEGzi1FNXnOaHy7IFlwS0DZGSAryhMGFpSss5gFxmbne6y4ei
         g4dN5QzYcQghNUzIOZ1JUdQ02xoGRbfEWbw3UQIYbtRAF/DLrV5BdA/X5f09jJ0yGVa0
         24cB3pbF0O7ETStJ4ZX3YMLopWkx3y2m3vPOwdakjqcBpj19VPS3RX869+G/PLK5/NJ0
         gNvbeIAYRZ22gWq2nhEtnEH4JsQhtNrKRk9+xsuTrlGL9Lr1nejZBDGFeLFmPgIclfvN
         Doc4IHs6WxzGE13FoR2op0hOndjYNLyXV+L0PUtPBWHZUToN1YNX7cBY44Sp+iFM1pZ8
         egqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=ahrM/t7BsqM+6RX3lL1WaHO29T0hW2ebTFEhSI/qU/M=;
        b=tjKS36xYOv5MnOPPzkl4GT0Swi5AdsuQEX7hi9PiF2X26E3wIyWH889lDtG0dwiDtE
         3LMfMpQ4vrQdZT7VAKl8nb+qzLzTQcPUeYLxT61wXy9hLNJ16SMvL569Wkxlc6onZ3lV
         TrxAn16DrqV+WQdWUT4EnYW8IlgWBo7LCivQovNCNsQzoUGCCRwcT11UC75hIAw04F3+
         wPFb/3ze2ikC8szNUxTcTlgKy4VYuKVDtWq1IQj+Xtp1tPy9I1DaBxgXdrLpgsgDhXDs
         AFR8IwPNzHjsXCa7e/TOJlegcw9ktfcgzCq7v/nIWhnD1Ujgd1Tp8hOrac4KbUa2Re+G
         NmSw==
X-Gm-Message-State: AOAM533SQ/ot9pHJ/SRKIVmsDO1qGrr/JXXOyrRDkp7F8BZXEJiKad4Q
	K2D4Zl8b2rbsGOIKWk8Futvfgw==
X-Google-Smtp-Source: ABdhPJwQOvDAP1fak1bWEsYzYL201FfpVHRoYrzrzfL+Girv8ybvEFj+/QrZMFH7VXbxbJ7p0ojErQ==
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr6460012pjt.198.1625772681069;
        Thu, 08 Jul 2021 12:31:21 -0700 (PDT)
Received: from smtpclient.apple ([2600:1010:b027:ad47:b493:1bc6:6c32:f48c])
        by smtp.gmail.com with ESMTPSA id z3sm4117432pgl.77.2021.07.08.12.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 12:31:20 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (1.0)
Subject: Re: [TECH TOPIC] Rust for Linux
Date: Thu, 8 Jul 2021 12:31:17 -0700
Message-Id: <3D69F05C-A039-4730-957B-02BE4E06C547@amacapital.net>
References: <YOdJLYmUkoMyszO7@kroah.com>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 James Bottomley <james.bottomley@hansenpartnership.com>,
 Julia Lawall <julia.lawall@inria.fr>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
In-Reply-To: <YOdJLYmUkoMyszO7@kroah.com>
To: Greg KH <greg@kroah.com>
X-Mailer: iPhone Mail (18F72)


> On Jul 8, 2021, at 11:51 AM, Greg KH <greg@kroah.com> wrote:
>=20
> =EF=BB=BFOn Thu, Jul 08, 2021 at 02:36:40PM +0100, Wedson Almeida Filho wr=
ote:
>>> On Thu, Jul 08, 2021 at 08:11:10AM +0200, Greg KH wrote:
>>> Thanks for the detailed explainations, it seems rust can "get away" with=

>>> some things with regards to reference counts that the kernel can not.
>>> Userspace has it easy, but note that now that rust is not in userspace,
>>> dealing with multiple cpus/threads is going to be interesting for the
>>> language.
>>>=20
>>> So, along those lines, how are you going to tie rust's reference count
>>> logic in with the kernel's reference count logic?  How are you going to
>>> handle dentries, inodes, kobjects, devices and the like?  That's the
>>> real question that I don't seem to see anyone even starting to answer
>>> just yet.
>>=20
>> None of what I described before is specific to userspace, but I understan=
d your
>> need to see something more concrete.
>>=20
>> I'll describe what we've done for `task_struct` and how lifetimes, aliasi=
ng
>> rules, sync & send traits help us achieve zero cost (when compared to C) b=
ut
>> also gives us safety. The intention here is to show that similar things c=
an (and
>> will) be done to other kernel reference-counted objects when we get to th=
em.
>=20
> <snip loads of good stuff here, thanks for helping describe all of this>
>=20
>=20
>>> And that's the reason some of us are asking to see a "real" driver, as
>>> those have to deal with these kernel-controlled-reference-counted
>>> objects properly (as well as hardware control).  Seeing how that is
>>> going to work in this language is going to be the real sign of if this
>>> is even going to be possible or not.
>>=20
>> Here's what I'd like to avoid: spending time on something that you all st=
ill
>> think is not typical enough. Would you be able to point us to a driver th=
at
>> would showcase the interactions you'd like to see so that (once we have i=
t in
>> Rust) we can have a discussion about the merits of the language?
>>=20
>> Hopefully something with interesting interactions with the kernel, but no=
t
>> with overly complex hardware, that is, something that doesn't require us t=
o read
>> a 400-page specification to implement.
>=20
> Examples were provided in the first series that was submitted a few
> months ago.  What was wrong with them?  And really, there is no need to
> dig through a huge spec, try porting an existing C driver will be much
> easier.
>=20
> But if you didn't like the previous examples (nvme block driver, i2c
> driver, gpio driver), how about looking at the drivers used by your
> current desktop and picking something that you use today that actually
> talks to hardware?

I would suggest a virtio device.  The core virtio guest code is horribly uns=
afe, and various stakeholders keep trying to make it slightly less unsafe. A=
 Rust implementation of the entire virtio ring (or at least the modern bits)=
 and of some concrete device (virtio-blk?) would be quite nice.

I think that, at least for an initial implementation, erroring out in the !u=
se_dma case would be fine. The !use_dma virtio variant is, in my opinion, a h=
istorical error and does not really deserve to survive going forward. The po=
werpc people may beg to differ.  Any port of the !use_dma variant to Rust (o=
r anything that safely manages device memory) will quickly notice that the r=
esulting use of device memory is nonsense and ought not to compile without u=
nsafe annotations in various places. And those unsafe annotations may well d=
eserve comments like /* yes, this is indeed wrong. */.

Fortunately, at least on non-powerpc, you can easily boot a system in the sa=
ne use_dma mode. Virtme will do this for you with minimal effort.

