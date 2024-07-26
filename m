Return-Path: <ksummit+bounces-1503-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB10293D659
	for <lists@lfdr.de>; Fri, 26 Jul 2024 17:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09A911C23609
	for <lists@lfdr.de>; Fri, 26 Jul 2024 15:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859F317C21F;
	Fri, 26 Jul 2024 15:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXHRJzXM"
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5914A17A580
	for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008471; cv=none; b=KqIVolUp31Mr/MMdQepHV+hdkU9DAOiriUoEHZu/Gw8vKYAKO1xJIukIn82E86DN9lvsJNP4/c5KGeqKapkqxv151cpOF0f8MBdH9dY+juzZF56oN9Bsz36p9bJC7jfSjbmJ3hNkSdeUsP/H+qmXaKxV21PxH7Tds2zdtvkLVjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008471; c=relaxed/simple;
	bh=+m9x2lcJKmFscPw/9L4WK4+WahMLKs9QvMZUOIPxGMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZMDr6HvfRi/BxpHqIXIkCxDUSAS/QiXyHxi2gzc89dxtYCk3AO6R9UIIjmfMbPkUIjiMZbjPQj7TgozppTkk282gVaY+lFvCapaZqbOFxO2vfGqge1IhiC7e4kCtcQvz+/+AfdFvsKty3gRANZedzioarbBGfvxB81tqvK+epc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXHRJzXM; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-821db15a930so261154241.1
        for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 08:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722008468; x=1722613268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+m9x2lcJKmFscPw/9L4WK4+WahMLKs9QvMZUOIPxGMg=;
        b=VXHRJzXM6FQEW206/ffY7Y0/bA4RzduxPn94FJLgZqazht+CujfSN5QrC/Nt76C/+H
         BJrzje1ASQy6Fv5mOUXZdZ3Hz7yxrprSJ8KFY/brRo/Jch4D9T579XWET1RAjifBVk8f
         XK36WKIJl3hfxr81TXX6FQXQs+Q37Lszxt+bxRnOac7plKoxaQ7C/Q8iM8We3HSyonxA
         SltjIMfyJRQCwaC07gn2oo83wooexHuOrMRItJWE7Nrb4PMBmtcUH4c5ykkvl8KJlo35
         z/tPghnuX0SQO//Tandsw0bdhIg5u0IpalNyFAY027uGmfwxZ718Tngs6dEguueKEhsn
         40ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008468; x=1722613268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m9x2lcJKmFscPw/9L4WK4+WahMLKs9QvMZUOIPxGMg=;
        b=fhoP1YhS+ma5daDJyHJ0RhA/7WyYbpljA07GXoRgj7hICdZaOqoRW0XL9cUGLNg3BQ
         IwlXRjq83eJuIvxQ9umiHM93v/jZu0emMtSyJdYpSLotIRXRCMXRFQlma76co7AX699o
         gE1YJXMyWePzyWh6Pc2YjpD0hBWQJqaWg0eoWHEnnNBjXNUwLZG0FspgGoD8UuTsi7iR
         AMc0fkX6p3ibAVminr5JBQ31Oaj25qcFQnbLVZirajQ4mJ8IZRAvT1Bzxrp9b3VDhlU1
         82MDcdLPmWjYjwO+uS1TSO4pNa+51skxeom91vo8u9M2LV+OYh3uz0AhXXrcz03UkREg
         FTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe95kwdBrJlY/IkJBNs0qcnhZJvl53SvyvuFPpvTf5rn1PvDbTKjIxly7UOATeX7dIMcyVMYwev/iFKApI03VdCEHVmWFkQA==
X-Gm-Message-State: AOJu0YwOec6S9VXo/r5KVAWWrxzVG4FlSurUG4Fo+uuY5aaLxVEHM0rU
	OEqfMemq7a9UVS/yPATy2FpolixXE4K2cVEdZI36PsjjNfvr6k2Nvo8V/c4JSDZMI5lltGz9JVB
	1fDrErDl4ejn2vkDcJ1qr6+eTaoOv9srlVDQ=
X-Google-Smtp-Source: AGHT+IEIIg66IecM+6lEWsGJgeICrY3+CjQGH9NUCEAv6vWv8s9rAshSONg/Ak9ihQ0DSZvfIRGMhFGCI3VQ9cTgx04=
X-Received: by 2002:a05:6102:dca:b0:48f:e8c6:7c53 with SMTP id
 ada2fe7eead31-493fadc7a4bmr7313137.31.1722008468133; Fri, 26 Jul 2024
 08:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <nycvar.YFH.7.76.2407231320210.11380@cbobk.fhfr.pm> <1e82a5c97e915144e01dd65575929c15bc0db397.camel@HansenPartnership.com>
 <20240724200012.GA23293@pendragon.ideasonboard.com> <CAPybu_0SN7m=m=+z5hu_4M+STGh2t0J-hFEmtDTgx6fYWKzk3A@mail.gmail.com>
 <20240725122315.GE7022@unreal> <CAPybu_1XsNq=ExrO+8XLqnV_KvSaqooM=yNy5iuzcD=-k5CdGA@mail.gmail.com>
 <20240725132035.GF7022@unreal> <20240725194202.GE14252@pendragon.ideasonboard.com>
 <CAPybu_3T8JNkZxf3pgCo4E4VJ3AZvY7NzeXdd7w9Qqe8=eV=9A@mail.gmail.com> <20240726131110.GD28621@pendragon.ideasonboard.com>
In-Reply-To: <20240726131110.GD28621@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 26 Jul 2024 17:40:50 +0200
Message-ID: <CAPybu_13+Axb2e_fVYeUv+S3UohbJXBYNF74Qd=pXz8_X3ic9g@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leon Romanovsky <leon@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jikos@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 3:11=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 26, 2024 at 10:02:27AM +0200, Ricardo Ribalda Delgado wrote:
> > On Thu, Jul 25, 2024 at 9:44=E2=80=AFPM Laurent Pinchart wrote:
> > > On Thu, Jul 25, 2024 at 04:20:35PM +0300, Leon Romanovsky wrote:
> > > > On Thu, Jul 25, 2024 at 03:02:13PM +0200, Ricardo Ribalda Delgado w=
rote:
> > > > > On Thu, Jul 25, 2024 at 2:23=E2=80=AFPM Leon Romanovsky wrote:
> > > > > > On Thu, Jul 25, 2024 at 11:26:38AM +0200, Ricardo Ribalda Delga=
do wrote:
> > > > > > > On Wed, Jul 24, 2024 at 10:02=E2=80=AFPM Laurent Pinchart wro=
te:
> > > > > >
> > > > > > <...>
> > > > > >
> > > > > > > It would be great to define what are the free software commun=
ities
> > > > > > > here. Distros and final users are also "free software communi=
ties" and
> > > > > > > they do not care about niche use cases covered by proprietary
> > > > > > > software.
> > > > > >
> > > > > > Are you certain about that?
> > > > >
> > > > > As a user, and as an open source Distro developer I have a small =
hint.
> > > > > But you could also ask users what they think about not being able=
 to
> > > > > use their notebook's cameras. The last time that I could not use =
some
> > > > > basic hardware from a notebook with Linux was 20 years ago.
> > > >
> > > > Lucky you, I still have consumer hardware (speaker) that doesn't wo=
rk
> > > > with Linux, and even now, there is basic hardware in my current
> > > > laptop (HP docking station) that doesn't work reliably in Linux.
> > > >
> > > > > > > They only care (and should care) about normal workflows.
> > > > > >
> > > > > > What is a normal workflow?
> > > > > > Does it mean that if user bought something very expensive he
> > > > > > should not be able to use it with free software, because his
> > > > > > usage is different from yours?
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > It means that we should not block the standard usage for 99% of t=
he
> > > > > population just because 1% of the users cannot do something fancy=
 with
> > > > > their device.
> > > >
> > > > Right, the problem is that in some areas the statistics slightly di=
fferent.
> > > > 99% population is blocked because 1% of the users don't need it and
> > > > don't think that it is "normal" flow.
> > > >
> > > > > Let me give you an example. When I buy a camera I want to be able=
 to
> > > > > do Video Conferencing and take some static photos of documents. I=
 do
> > > > > not care about: automatic makeup, AI generated background, unicor=
n
> > > > > filters, eyes recentering... But we need to give a way to vendors=
 to
> > > > > implement those things closely, without the marketing differentia=
tors,
> > > > > vendors have zero incentive to invest in Linux, and that affects =
all
> > > > > the population.
> > >
> > > I've seen these kind of examples being repeatedly given in discussion=
s
> > > related to camera ISP support in Linux. They are very misleading. The=
se
> > > are not the kind of features that are relevant for the device
> > > pass-through discussion these day. Those are high-level use cases
> > > implemented in userspace, and vendors can ship any closed-source
> > > binaries they want there. What I care about is the features exposed b=
y
> > > the kernel to userspace API.
> >
> > The ISPs are gradually becoming programmable devices and they indeed
> > help during all of those examples.
>
> I'd like to see more technical information to substantiate this claim.
> So far what I've sometimes seen is ISPs that include programmable
> elements, but hiding those behind a firmware that exposes a fixed
> (configurable) pipeline. I've also heard of attempts to expose some of
> that programmability to the operating system, which were abandoned in
> the end due to lack usefulness.
>
> > Userspace needs to send/receive information from the ISP, and that is
> > exactly what vendors want to keep in the close.
>
> But that's exactly what we need to implement an open userspace ecosystem
> :-)
>
> > Describing how they implement those algorithms is a patent minefield
> > and their differentiating factor.
>
> Those are also arguments I've heard many times before. The
> differentiating factor for cameras today is mostly in userspace ISP
> control algorithms, and nobody is telling vendors they need to open all
> that.

I disagree. The differentiating factor is what the ISP is capable of
doing and how they do it. Otherwise we would not see new ISPs in the
market.

If you define the arguments passed to an ISP you are defining the
algorithm, and that is a trade secret and/or a patent violation.

>
> When it comes to patents, we all know how software patents is a
> minefield, and hardware is also affected. I can't have much sympathy for
> this argument though, those patents mostly benefit the largest players
> in the market, and those are the ones who currently claim they can't
> open anything due to patents.

Big players do not usually sue each other. The big problem is patent
trolls that "shoot at everything that moves".

I dislike patents, but it is the world we have to live in. No vendor
is going to take our approach if they risk a multi million dollar
lawsuit.


>
> > > > > This challenge seems to be solved for GPUs. I am using my AMD GPU
> > > > > freely and my nephew can install the amdgpu-pro proprietary user =
space
> > > > > driver to play duke nukem (or whatever kids play now) at 2000 fps=
.
> > > > >
> > > > > There are other other subsystems that allow vendor passthrough an=
d
> > > > > their ecosystem has not collapsed.
> > > >
> > > > Yes, I completely agree with you on that.
> > > >
> > > > > Can we have some general guidance of what is acceptable? Can we d=
efine
> > > > > together the "normal workflow" and focus on a *full* open source
> > > > > implementation of that?
> > > >
> > > > I don't think that is possible to define "normal workflow". Require=
ment
> > > > to have open-source counterpart to everything exposed through UAPI =
is a
> > > > valid one. I'm all for that.
> > >
> > > That's my current opinion as well, as least when it comes to the kern=
el
> > > areas I mostly work with.
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

