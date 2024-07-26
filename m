Return-Path: <ksummit+bounces-1505-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497193D664
	for <lists@lfdr.de>; Fri, 26 Jul 2024 17:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 058901F24BA3
	for <lists@lfdr.de>; Fri, 26 Jul 2024 15:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE2B17C224;
	Fri, 26 Jul 2024 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGvFPFPw"
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616F07494
	for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008670; cv=none; b=mVmnlG9pQETXHO8xqCv33gJUuCwjLsmBpTQ28GgTU2kW7bP9zyTl7JQ97L3+HUvOQV0/l7t568Ly8/P8mlfqVNfXcD+SO6nEbPhlXEQp4Zmice/sULVLbx4wA/RZDJ2M0fW1bmyf+MrfxttMv4OFUQM9ymutwOqog2rbelEFM+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008670; c=relaxed/simple;
	bh=jRstgWnYQrNMmrCiEk5+OoIRUV6Pd3MryI0TICTmsuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oOyUYv3bjc/f/FD+rDESdGw4RYSIAhlKXxOlpAz6e4EQiJPw24zTI/1w6orSmfKhAwykj+XxwPNSflvHFzsuod98qrFzbCirc33OV3k1YXWgTG4HB2R3u4BcpAVw0W1vcRZeCHJBrY8V0HaOyW6F8kjwE0xrqjSdKzqSUQx3mJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGvFPFPw; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-49297fca3c2so671259137.1
        for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722008667; x=1722613467; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+IcKkHtS4HDxN+3KD/ToJzbH8IWzqH2YCm7xgAw7DQ=;
        b=eGvFPFPw/WalXzG0v20XVHGz2iNAt7kd88K/O1onDpncfE8KP6j+JhNgmDSl8XR2g0
         h8DEO2Y8gJb412smK/0oy+rQXilwIr1/rmGIbKq3tsF1dk0/jjYahceCU/Gew2yDreOZ
         4X4VMU4Ktg0DtZD8PxLK4hvFcJJx3TA4LJWhJaGh7l9toXgIgT3aiN7nlzkLBci9dxVi
         NgFJXNfWaA9OT4asff+jzJG6d7PStRXE3dzC3vvMbdcww2GzYZNb1WW99ZXlZL0T1FiL
         e88SIN9zVBRCRehg+R0I7GVvr6Z98iQNKsA6bIPXK2BVt43W45EDCqLqr5oaQosDWftd
         S0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008667; x=1722613467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+IcKkHtS4HDxN+3KD/ToJzbH8IWzqH2YCm7xgAw7DQ=;
        b=F6xx73c5CV1WTR1WDRLrAvB2zQ1jL1z0875E52gf/gkXCeoEBm2UxKiwCS1ufBz1Bk
         mxtAHmP9c43VrDvPlr84WVG3uGCYdeFAZJ0vzKK/hlVdIkrOoRsaan5w8TZ6OEdyhivI
         cRQDkPx7E5qUEpCenZMFKZNQioCx5RmXlRA2pF04BedGTSjSFryT1KbNbky6lgPL6pY3
         sI18f7Fu849Ib4JnUEloCdCtTcmOwQXRwYXI2j8KX+BDDN3JjFAPUbA9TI38y1wlAWAB
         Q4plAP5w6lLVuwQxntnJeMak09YI/vJh4JKVG4ZVAllZIuCxWSvEdqUisz2DWJumtzsp
         RDKg==
X-Forwarded-Encrypted: i=1; AJvYcCUEcm7+IW5bzdhha2Kkp/wwuEME283UDhalcD3eiGBk8c6Pg8Mugx1nWQQzYnspsV+dtZ8AB8hVWsuErbrtRXEy2Huh5hWRHg==
X-Gm-Message-State: AOJu0YycD5NKXUl20yOFCElloXEuSIlptktHq0MDHW1snAjaulk6AUa4
	GXuGc1y9U6VhlW7CVkuUFQF5yZNgY6kOz98veQQJBt00BhUFQh9Oo5M+j466u0Rzvb6tHOUg0W1
	t+gwcul63Jxfy0+RAp+R1REX1bHg=
X-Google-Smtp-Source: AGHT+IG4hJYdUxZbZt3td+5S69xRScX2vzZU6EeVKnkjL42qRmUq1pC8nK2yjnZpbgv6dhKFnF21juBd2VIBL8535Nw=
X-Received: by 2002:a05:6102:94e:b0:493:bcae:cd0 with SMTP id
 ada2fe7eead31-493faa1fad3mr59149137.9.1722008667274; Fri, 26 Jul 2024
 08:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <nycvar.YFH.7.76.2407231320210.11380@cbobk.fhfr.pm> <1e82a5c97e915144e01dd65575929c15bc0db397.camel@HansenPartnership.com>
 <20240724200012.GA23293@pendragon.ideasonboard.com> <a75782218f34ae3cff725cbcfb321527f6aa2e14.camel@HansenPartnership.com>
 <20240725193125.GD14252@pendragon.ideasonboard.com> <CAPybu_3GkgcORm0Jbp8ze_rjfXDws8xWT_sQcs_39KY54zpnQg@mail.gmail.com>
 <20240726132220.GE28621@pendragon.ideasonboard.com>
In-Reply-To: <20240726132220.GE28621@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 26 Jul 2024 17:44:09 +0200
Message-ID: <CAPybu_1FFpCUmTfRgfxaifxLVcH9+anLK2=ATPTMiKcWE22Oow@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Jiri Kosina <jikos@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 3:22=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 26, 2024 at 10:03:36AM +0200, Ricardo Ribalda Delgado wrote:
> > On Thu, Jul 25, 2024 at 9:32=E2=80=AFPM Laurent Pinchart wrote:
> > > On Wed, Jul 24, 2024 at 04:37:21PM -0400, James Bottomley wrote:
> > > > On Wed, 2024-07-24 at 23:00 +0300, Laurent Pinchart wrote:
> > > > [...]
> > > > > What I get from the discussions I've followed or partcipated in o=
ver
> > > > > the years is that the main worry of free software communities is
> > > > > being forced to use closed-source userspace components, whether t=
hat
> > > > > would be to make the device usable at all, or to achieve decent l=
evel
> > > > > of performance or full feature set. We've been through years of
> > > > > mostly closed-source GPU support, of printer "windrivers", and qu=
ite
> > > > > a few other horrors. The good news is that we've so far overcome =
lots
> > > > > (most) of those challenges. Reverse engineering projects paid off=
,
> > > > > and so did working hand-in-hand with industry actors in multiple =
ways
> > > > > (both openly and behind the scenes). One could then legitimately =
ask
> > > > > why we're still scared.
> > > >
> > > > I don't think I am.  We're mostly fully capable of expounding at le=
ngth
> > > > on the business rationale for being open if the thing they're hidin=
g
> > > > isn't much of a differentiator anyway (or they're simply hiding it =
to
> > > > try to retain some illusion of control), so we shouldn't have any f=
ear
> > > > of being able to make our case in language business people understa=
nd.
> > > >
> > > > I also think this fear is partly a mindset problem on our part.  We
> > > > came out of the real fight for openness and we do embrace things li=
ke a
> > > > licence that forces open code (GPL) and symbols that discourage
> > > > proprietary drivers (EXPORT_SYMBOL_GPL), so we've somewhat drunk th=
e
> > > > FSF coolaid that if we don't stand over manufacturers every second =
and
> > > > force them they'll slide back to their old proprietary ways.  Howev=
er,
> > > > if you look at the entirely permissive ecosystem that grew up after=
 we
> > > > did (openstack, docker, kubernetes, etc.) they don't have any such =
fear
> > > > and yet they still have large amounts of uncompelled openness and g=
ive
> > > > back.
> > >
> > > I don't think those are necessarily relevant examples, as far as devi=
ce
> > > pass-through goes. Vendors have many times reverted to proprietary wa=
ys,
> > > and they still do, at least in the areas of the kernel I'm most activ=
e
> > > in. I've seen first hand a large SoC vendor very close to opening a
> > > significant part of their camera stack and changing their mind at the
> > > last minute when they heard they could possibly merge their code thro=
ugh
> > > a different subsystem with a pass-through blank cheque.
> >
> > Without knowing who that large SoC vendor is, and what they will be
> > willing to open, it is difficult to know what opportunity has been
> > lost.
>
> I would also like to discuss this in more details, but I can't do so
> publicly :-( That's why I don't want to focus too much on this argument.
>
> > I would argue that if they have cancelled their open plans based
> > on an hypothesis, their willingness to open was not that high.
>
> That's exactly what I previously described in this mail thread as areas
> where cooperation with vendors is in its infancy. Convincing large
> industry players is long term work, and it's very demotivating when you
> think there's finally light at the end of the tunel, and plans gets
> cancelled at the last minute. We're not giving up though.
>
> > It would be more healthy for the ecosystem, if those discussions were
> > done more openly, at least all the core maintainers should be
> > involved.
>
> Can you get all the camera vendors you work with to talk about all this
> openly ? :-) We all know it's a difficult and long process.

We have pushed lots of vendors to contribute directly upstream. You
can see a lot of code that has landed thanks to this effort.
And I have tried very hard to get them involved in all the discussions upst=
ream.


>
> > > I'm willing to believe it can be different in other areas, which may
> > > partly explain why different subsystems and different developers have
> > > different biases and have trouble understand each other's point of vi=
ew.
> >
> > It is not different in other areas, it is the same area. At the end of
> > the day it is the same chip manufacturers, with the same legal teams.
> > It is our attitude that is different.
>
> I don't agree with that. Not only are there different manufacturers,
> there are also different teams, with different approaches. The world is
> not uniform.
>
> > > > > I can't fully answer that question, but there are two points that=
 I
> > > > > think are relevant. Note that due to my background and experience=
,
> > > > > this will be heavily biased towards consumer and embedded hardwar=
e,
> > > > > not data centre-grade devices. Some technologies from the latter
> > > > > however have a tendency to migrate to the former over time, so th=
e
> > > > > distinction isn't necessarily as relevant as one may consider.
> > > > >
> > > > > The first point is that hardware gets more complicated over time,=
 and
> > > > > in some markets there's also an increase in the number of vendors=
 and
> > > > > devices. There's a perceived (whether true or not) danger that we
> > > > > won't be able to keep up with just reverse engineering and a
> > > > > development model relying on hobyists. Getting vendors involved i=
s
> > > > > important if we want to scale.
> > > >
> > > > Yes, but there are lots of not very useful complex devices being
> > > > produced every day that fail to capture market share.  Not having
> > > > reverse engineered drivers for them is no real loss.  If a device d=
oes
> > > > gain market share, it gains a huge pool of users some of whom becom=
e
> > > > interested in reverse engineering, so I think market forces actuall=
y
> > > > work in our favour: we get reverse engineering mostly where the dev=
ices
> > > > are actually interesting and capture market share.  It's self scali=
ng.
> > >
> > > I can't agree with that, sorry. Not only is the difficulty to
> > > reverse-engineer some classes of devices increasing, but saying that
> > > only devices that make it to the top of the market share chart are wo=
rth
> > > considering will leave many users on the side of the road.
> >
> > Today we have left BILLIONS of users at the other side of the road.
>
> Because we're the only ones to be blamed, or more accuretely, the blame
> is solely on me. Vendors are all saints who want the best for the world.
> This argument doesn't hold. Please stop with this, I don't want to get
> to name calling.

Nobody said that it was your fault. You and all the media community
have invested thousands of hours of their personal time in Linux.

It is healthy to make a retrospective of where we are now and if we
are helping our users or not.

The reality is that we are reaching a very small percentage of users,
and vendors prefer to work out of the tree than with us. Even vendors
that traditionally have been very good Linux players have issues
landing their code.

Can we try to figure out why it is happening? Can we try something
new? Maybe inspired in other subsystems?


>
> > > > > Second, I think there's a fear of regression. For some categories=
 of
> > > > > devices, we have made slow but real progress to try and convince =
the
> > > > > industry to be more open. This sometimes took a decade of work,
> > > > > patiently building bridges and creating ecosystems brick by brick=
.
> > > > > Some of those ecosystems are sturdy, some not so. Giving pass-thr=
ough
> > > > > a blank check will likely have very different effects in differen=
t
> > > > > areas. I don't personally believe it will shatter everything, but=
 I'm
> > > > > convinced it carries risk in areas where cooperation with vendors=
 is
> > > > > in its infancy or is fragile for any other reason.
> > > >
> > > > I also think we're on the rise in this space.  Since most cloud
> > > > workloads are on Linux, there's huge market pressure on most "found=
 in
> > > > the cloud" devices (like accelerators and GPUs) to have an easy to
> > > > consume Linux story.  Nvidia is a case in point.  When it only care=
d
> > > > about fast games on some other OS, we get shafted with a proprietar=
y
> > > > graphics drivers.  Now it's under pressure to be the number one AI
> > > > accelerator provider for the cloud it's suddenly wondering about op=
en
> > > > source drivers to make adoption easier.
> > >
> > > I can't comment on Nvidia and their inference engines in particular. =
The
> > > server market may be in a better position that the consumer and embed=
ded
> > > market, and if that's the case, I'm happy for the servers. That doesn=
't
> > > solve the issues in other markets though.
> > >
> > > > > Finally, let's not forget that pass-through APIs are not an all o=
r
> > > > > nothing option. To cite that example only, DRM requires GPU drive=
rs
> > > > > to have an open-source userspace implementation to merge the kern=
el
> > > > > driver, and the same subsystems strongly pushes for API
> > > > > standardization for display controllers. We can set different rul=
es
> > > > > for different cases.
> > > >
> > > > I certainly think we can afford to experiment here, yes.
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

