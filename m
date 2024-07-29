Return-Path: <ksummit+bounces-1522-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A888293F1F8
	for <lists@lfdr.de>; Mon, 29 Jul 2024 11:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6854628690B
	for <lists@lfdr.de>; Mon, 29 Jul 2024 09:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1A4142E78;
	Mon, 29 Jul 2024 09:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHggR6H1"
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C109978C63
	for <ksummit@lists.linux.dev>; Mon, 29 Jul 2024 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247025; cv=none; b=P/nSUCOd5aux8H0c2TRn/0dKk05PVhm6aI81sMlAgqgdLtr5BhmNbqKVAjGtISsSDZxoXPG+3PyRN0PjypBr/tll8O53eRr94dFHD2qc2xab8QOMW1ccSR4ptXg3fH/gnfF7jSyXsXqDY2dJJ467K3sFtTnjKmZKgs3/uhL0B/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247025; c=relaxed/simple;
	bh=PAqXGJygzSTZidxpH9cDasJVvH3NY1n3b8QseUnmMuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTbcFsopwVWVRAMWNRWReQdw855l+PAYHDHfFz7QFHMyYJQLlemYZajeY5Mw+QAEoAwiQ3cA8vadyhaQCrmfkd+fu6NHjp8QT6mZlOwdRNU6+YBAt0fuD8txjNq0KLJDvWMTSD8LQdr4Rk4DoBOORg+h145QIOPaG4n7b5Diyl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHggR6H1; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-823227e7572so1830912241.1
        for <ksummit@lists.linux.dev>; Mon, 29 Jul 2024 02:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722247022; x=1722851822; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAqXGJygzSTZidxpH9cDasJVvH3NY1n3b8QseUnmMuA=;
        b=PHggR6H1hApMNoXNrTFYv05yuIU15MAoTO3lRWwsMJE1NWahL+RZ4Cf+IrWX7LDTA/
         WwPoKi2mUAR63onDbiYFdMn8pyqxRGKldHLbF2PaqNvWQUYXYrERr3MdB2RKtEhdMDhb
         cQxaKqhtGQE8LNr3nXAQF2N4UiNFHCX9LCdUWVKNDwjmBS7AMC+SXbX39RUz/yWCX7u3
         ZTTBBzxaBtrXdVVk0KfZ+3lQN9C0UBfV27Ws0f1cllpXwvWDgNNZBrXBObTfsXLyz/FW
         T8wdrg7Pkj3Tq5MTE6TaPoz23JZt5fnTrKo6w5uTZe0+VZvm6GK5zfynFHDE5ofrvk4C
         Oo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722247023; x=1722851823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAqXGJygzSTZidxpH9cDasJVvH3NY1n3b8QseUnmMuA=;
        b=oicWMe6gBfbK/XGODDcwWyQAsoJKGsOnBcrpO/7kuxwQv3/dakLGOOTeOStuJ3Yyb1
         x52ibX/vsC1drnD8DMjA2lDRBoIfHqBYjPntLQCP4hWrQHYRE69ajfqV8mG9Vo33vodB
         khctlS7YbAmc95FlPbSIL5s0TXw86MP0KeL/V9Ct4TPVp8EKgcOrPfDYLi469o2y5msW
         wLL4zOQrGkDPDVQVIvnoCWCPbFN+Uu1bGWG1PQ8d4aXt2hCEoNqNqECFSZlUs3P7ZER5
         RBdN8kQuhMvJfU70EvYpqoRnGZoJoQ2VmpxxZADibe6BbTZbodTokpNEGZBhIQnjzTpO
         8jaw==
X-Forwarded-Encrypted: i=1; AJvYcCU/e0nYef31znQ20vcvsk8g3RW6M7zd6hzXnMhsi9bTcLScGSC3DmgAyhO3pTQVOUnW2sropbQLfx0/qIideqvOzLNHiD7JEA==
X-Gm-Message-State: AOJu0YxzgwItZXXZceuMjcU0TjEz/NR1HSe9gMM+krisaExHUhBwu+/R
	AS5ti+0PY+E5vr1dgkvgHo2+o/trW7rmmMGYZ9STWhGaxAVXtMo9twrgwhuYjmljAhCvikVny9s
	2mVw7k7UGEGNiWlT6wgcAeZHSDFI=
X-Google-Smtp-Source: AGHT+IHfpEgdK6CsV+F3yazUkSk8QqXglhxHjEfu5TJN0ovzIavcWBVUOhONbVyIYLlhDjDkrM+qW9jYThqbl3gCAwE=
X-Received: by 2002:a05:6102:509e:b0:493:b055:bf3b with SMTP id
 ada2fe7eead31-493fafe37efmr2966777137.7.1722247022445; Mon, 29 Jul 2024
 02:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1e82a5c97e915144e01dd65575929c15bc0db397.camel@HansenPartnership.com>
 <20240724200012.GA23293@pendragon.ideasonboard.com> <CAPybu_0SN7m=m=+z5hu_4M+STGh2t0J-hFEmtDTgx6fYWKzk3A@mail.gmail.com>
 <20240725122315.GE7022@unreal> <CAPybu_1XsNq=ExrO+8XLqnV_KvSaqooM=yNy5iuzcD=-k5CdGA@mail.gmail.com>
 <20240725132035.GF7022@unreal> <20240725194202.GE14252@pendragon.ideasonboard.com>
 <CAPybu_3T8JNkZxf3pgCo4E4VJ3AZvY7NzeXdd7w9Qqe8=eV=9A@mail.gmail.com>
 <20240726131110.GD28621@pendragon.ideasonboard.com> <CAPybu_13+Axb2e_fVYeUv+S3UohbJXBYNF74Qd=pXz8_X3ic9g@mail.gmail.com>
 <20240728112358.GB30973@pendragon.ideasonboard.com>
In-Reply-To: <20240728112358.GB30973@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 29 Jul 2024 11:56:45 +0200
Message-ID: <CAPybu_0vNbwO6NkWb_P7F+1TZtddmAAgC69X8c0WtZ5P2JoeBg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leon Romanovsky <leon@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jikos@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 1:24=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 26, 2024 at 05:40:50PM +0200, Ricardo Ribalda Delgado wrote:
> > On Fri, Jul 26, 2024 at 3:11=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > On Fri, Jul 26, 2024 at 10:02:27AM +0200, Ricardo Ribalda Delgado wro=
te:
> > > > On Thu, Jul 25, 2024 at 9:44=E2=80=AFPM Laurent Pinchart wrote:
> > > > > On Thu, Jul 25, 2024 at 04:20:35PM +0300, Leon Romanovsky wrote:
> > > > > > On Thu, Jul 25, 2024 at 03:02:13PM +0200, Ricardo Ribalda Delga=
do wrote:
> > > > > > > On Thu, Jul 25, 2024 at 2:23=E2=80=AFPM Leon Romanovsky wrote=
:
> > > > > > > > On Thu, Jul 25, 2024 at 11:26:38AM +0200, Ricardo Ribalda D=
elgado wrote:
> > > > > > > > > On Wed, Jul 24, 2024 at 10:02=E2=80=AFPM Laurent Pinchart=
 wrote:
> > > > > > > >
> > > > > > > > <...>
> > > > > > > >
> > > > > > > > > It would be great to define what are the free software co=
mmunities
> > > > > > > > > here. Distros and final users are also "free software com=
munities" and
> > > > > > > > > they do not care about niche use cases covered by proprie=
tary
> > > > > > > > > software.
> > > > > > > >
> > > > > > > > Are you certain about that?
> > > > > > >
> > > > > > > As a user, and as an open source Distro developer I have a sm=
all hint.
> > > > > > > But you could also ask users what they think about not being =
able to
> > > > > > > use their notebook's cameras. The last time that I could not =
use some
> > > > > > > basic hardware from a notebook with Linux was 20 years ago.
> > > > > >
> > > > > > Lucky you, I still have consumer hardware (speaker) that doesn'=
t work
> > > > > > with Linux, and even now, there is basic hardware in my current
> > > > > > laptop (HP docking station) that doesn't work reliably in Linux=
.
> > > > > >
> > > > > > > > > They only care (and should care) about normal workflows.
> > > > > > > >
> > > > > > > > What is a normal workflow?
> > > > > > > > Does it mean that if user bought something very expensive h=
e
> > > > > > > > should not be able to use it with free software, because hi=
s
> > > > > > > > usage is different from yours?
> > > > > > > >
> > > > > > > > Thanks
> > > > > > >
> > > > > > > It means that we should not block the standard usage for 99% =
of the
> > > > > > > population just because 1% of the users cannot do something f=
ancy with
> > > > > > > their device.
> > > > > >
> > > > > > Right, the problem is that in some areas the statistics slightl=
y different.
> > > > > > 99% population is blocked because 1% of the users don't need it=
 and
> > > > > > don't think that it is "normal" flow.
> > > > > >
> > > > > > > Let me give you an example. When I buy a camera I want to be =
able to
> > > > > > > do Video Conferencing and take some static photos of document=
s. I do
> > > > > > > not care about: automatic makeup, AI generated background, un=
icorn
> > > > > > > filters, eyes recentering... But we need to give a way to ven=
dors to
> > > > > > > implement those things closely, without the marketing differe=
ntiators,
> > > > > > > vendors have zero incentive to invest in Linux, and that affe=
cts all
> > > > > > > the population.
> > > > >
> > > > > I've seen these kind of examples being repeatedly given in discus=
sions
> > > > > related to camera ISP support in Linux. They are very misleading.=
 These
> > > > > are not the kind of features that are relevant for the device
> > > > > pass-through discussion these day. Those are high-level use cases
> > > > > implemented in userspace, and vendors can ship any closed-source
> > > > > binaries they want there. What I care about is the features expos=
ed by
> > > > > the kernel to userspace API.
> > > >
> > > > The ISPs are gradually becoming programmable devices and they indee=
d
> > > > help during all of those examples.
> > >
> > > I'd like to see more technical information to substantiate this claim=
.
> > > So far what I've sometimes seen is ISPs that include programmable
> > > elements, but hiding those behind a firmware that exposes a fixed
> > > (configurable) pipeline. I've also heard of attempts to expose some o=
f
> > > that programmability to the operating system, which were abandoned in
> > > the end due to lack usefulness.
> > >
> > > > Userspace needs to send/receive information from the ISP, and that =
is
> > > > exactly what vendors want to keep in the close.
> > >
> > > But that's exactly what we need to implement an open userspace ecosys=
tem
> > > :-)
> > >
> > > > Describing how they implement those algorithms is a patent minefiel=
d
> > > > and their differentiating factor.
> > >
> > > Those are also arguments I've heard many times before. The
> > > differentiating factor for cameras today is mostly in userspace ISP
> > > control algorithms, and nobody is telling vendors they need to open a=
ll
> > > that.
> >
> > I disagree. The differentiating factor is what the ISP is capable of
> > doing and how they do it. Otherwise we would not see new ISPs in the
> > market.
>
> Hardware certainly evolves, but it's far from being the main
> differentiating factor in the markets and use cases you're usually
> referring to.
>
> > If you define the arguments passed to an ISP you are defining the
> > algorithm, and that is a trade secret and/or a patent violation.
>
> Are you confusing ISP processing blocks, sometimes referred to as
> algorithms, and ISP control algorithms ? There is absolutely no way to
> do anything with an ISP, not even the bare minimum, if you don't know
> what parameters to pass to it.

Any ISP released in the last few years has *hundreds of thousands* of
parameters.

We only modify hundreds of parameters during runtime. Those are the
ones we need to be documented.

If we enforce a "usable open camera stack", we will have the
documentation and the code needed to use the ISP.

Asking vendors to document *ALL* the parameters means describing how
they have implemented the internals of the ISP camera algorithms.


>
> > > When it comes to patents, we all know how software patents is a
> > > minefield, and hardware is also affected. I can't have much sympathy =
for
> > > this argument though, those patents mostly benefit the largest player=
s
> > > in the market, and those are the ones who currently claim they can't
> > > open anything due to patents.
> >
> > Big players do not usually sue each other. The big problem is patent
> > trolls that "shoot at everything that moves".
> >
> > I dislike patents, but it is the world we have to live in. No vendor
> > is going to take our approach if they risk a multi million dollar
> > lawsuit.
>
> When was the last time anyone heard of big players pushing to reform the
> patent system ? At best there are initiatives such as OIN, which some
> large companies have supporting. It's still a workaround though.
>
> > > > > > > This challenge seems to be solved for GPUs. I am using my AMD=
 GPU
> > > > > > > freely and my nephew can install the amdgpu-pro proprietary u=
ser space
> > > > > > > driver to play duke nukem (or whatever kids play now) at 2000=
 fps.
> > > > > > >
> > > > > > > There are other other subsystems that allow vendor passthroug=
h and
> > > > > > > their ecosystem has not collapsed.
> > > > > >
> > > > > > Yes, I completely agree with you on that.
> > > > > >
> > > > > > > Can we have some general guidance of what is acceptable? Can =
we define
> > > > > > > together the "normal workflow" and focus on a *full* open sou=
rce
> > > > > > > implementation of that?
> > > > > >
> > > > > > I don't think that is possible to define "normal workflow". Req=
uirement
> > > > > > to have open-source counterpart to everything exposed through U=
API is a
> > > > > > valid one. I'm all for that.
> > > > >
> > > > > That's my current opinion as well, as least when it comes to the =
kernel
> > > > > areas I mostly work with.
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

