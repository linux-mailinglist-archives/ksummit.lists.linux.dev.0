Return-Path: <ksummit+bounces-1504-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304A93D661
	for <lists@lfdr.de>; Fri, 26 Jul 2024 17:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8730E1C23561
	for <lists@lfdr.de>; Fri, 26 Jul 2024 15:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7C017BB3F;
	Fri, 26 Jul 2024 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8Idk14R"
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DC65588B
	for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008622; cv=none; b=sFowP9ar2TeBHLJ87iPnKpaIm4NfZYVEDOkx5uY5TUVKAvsroGTYnDbHPEmGxrzOCcEpfXRTs/w0IkOCFmMm11rUA632gfG1ZEZrzU5gDWjW0Z6eWM4A9mmWOlLgq5RJKACUH3WByqPDCly92amUIsbM27Qhi9E/RM2Zy1v1ta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008622; c=relaxed/simple;
	bh=vhTnl45JIHDD0H+tAzwiMG4CnPR+IcEAAcDnIULISvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHPO6Jhfr1Lr+Y8p3Kum+f1QvdVXtM73ZTjC+VNTnMtTRSk3v1gN/+w5od3wEYZNehfyBBOziUB/0J7337VNkH20gXdpDaOx7c4TcxSk2QBB0lQAyFTf41GysmPXJSnDicK0tg1x89EI6CQyrnG1QwZM+OwqLFd8VY6HMrSUHws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8Idk14R; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8318b4d9539so223788241.2
        for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722008619; x=1722613419; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhTnl45JIHDD0H+tAzwiMG4CnPR+IcEAAcDnIULISvU=;
        b=m8Idk14R4hNFnswABGA8Qp+ysiHutWZZpC5RPLxGpBpJXVTT6F1W+BHxkLAOqRyiM6
         4M1PX88tiiR8JA/lSk9Ht7h+pW8PHDp03cL4G9XeyDLpf+hYyEhytyaImMcYgsrx9AAj
         N3ulObBmyhZF3rT3tmvtlc90xKvbbktFR/kyD4QNLcysicuVeo3Fyp3Tel6zRLVlIUl7
         AhwQyLp9C4NNYQkP+e8BOnc2eIKNaElB8FqocVksxvAW4btnarkhczsElB/i5ekK7gHV
         uSBYVkmoIGp78NAv34PdzMl3d6qiBGcLYGZMWtKyhvem7pNB4LzzE/NIPJUAETHwRIYP
         cLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008619; x=1722613419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vhTnl45JIHDD0H+tAzwiMG4CnPR+IcEAAcDnIULISvU=;
        b=SW9ut9OtCC9tPElR+FrD3/l/Jn2OoNSPO1Lrp3QBZs6eYgFQEsV9BbILZitf77EGCC
         pWCVfaIdRBAH/0qXoHXIDdiKgyNY82QpxyISij9lkADOItF9CkxnQT/kLKUFg1XESW5s
         BlpinmORzulLkQEQ/sr1FmSdgfw1rO2PaKKQSZwt0iQGIHn3Lq1+W1QouvRMK+W7Y+s4
         PpIJd95gOwQRNtgObEOD+2A8HbSVGxu+5pK1NQ/9xyZ4+oWptLOqMHq4PA4yXkovsNno
         Gu0so5p7MC4ccMtBXTi8TlrTpwpMyUSbQxE00v6wraiK1jdEpDnFz1PxVpbHbJLGuf/F
         41nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb/wk9BteeMyrlgPFBhWISTPUGUi8c9jF1igwtuYXeq545dxooFIsOl4QHN1tWTghbMZX/XhhAAxuHpw55Hvsuf+QSKsQXTg==
X-Gm-Message-State: AOJu0Yy4ssIC1nnZv4LtG6TNNrGBJbAk9A+TZj4YtF3iANW+7gHLtB6d
	565hL5Dl59F9QoTwAeHDm3rEdeZ1s9Zzq/1X3YbSOz4C4bgm2gmPqZ/wob5tm6OsiFtn7GAth2S
	KVraXph4fvEw7Ta8H2ODH9gXwdU99OZ9lHYg=
X-Google-Smtp-Source: AGHT+IEgQo/9wg7PiJi8ZpLJHpZAGc14Lovj6s9bfiax6cs4MvM80xVDooEjreFb4OJvgA72u2z/UC90dgENbs/poBI=
X-Received: by 2002:a05:6102:f96:b0:493:ce48:a2ed with SMTP id
 ada2fe7eead31-493fa46f02emr93862137.29.1722008619379; Fri, 26 Jul 2024
 08:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2407231320210.11380@cbobk.fhfr.pm>
 <1e82a5c97e915144e01dd65575929c15bc0db397.camel@HansenPartnership.com>
 <20240724200012.GA23293@pendragon.ideasonboard.com> <a75782218f34ae3cff725cbcfb321527f6aa2e14.camel@HansenPartnership.com>
 <20240725193125.GD14252@pendragon.ideasonboard.com> <20240725194314.GS3371438@nvidia.com>
 <20240725200703.GG14252@pendragon.ideasonboard.com> <CAPybu_0C44q+d33LN8yKGSyv6HKBMPNy0AG4LkCOqxc87w3WrQ@mail.gmail.com>
 <20240726124949.GI32300@pendragon.ideasonboard.com> <20240726131106.GW3371438@nvidia.com>
 <20240726142217.GF28621@pendragon.ideasonboard.com>
In-Reply-To: <20240726142217.GF28621@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 26 Jul 2024 17:43:21 +0200
Message-ID: <CAPybu_3+J-e-s2+3KV51Nc4Z1rys98xnN6p_0xXkdag-no09JQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jiri Kosina <jikos@kernel.org>, Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 4:22=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 26, 2024 at 10:11:06AM -0300, Jason Gunthorpe wrote:
> > On Fri, Jul 26, 2024 at 03:49:49PM +0300, Laurent Pinchart wrote:
> >
> > > What is not an option exactly in my description above ? We have multi=
ple
> > > V4L2 drivers for ISPs. They receive ISP parameters from userspace
> > > through a data buffer. It's not allowed to be opaque, but it doesn't
> > > prevent vendor closed-source userspace implementations with additiona=
l
> > > *camera* features, as long as the *hardware* features are available t=
o
> > > everybody.
> >
> > How far do you take opaque?
> >
> > In mlx5 we pass command buffers from user to kernel to HW and the
> > kernel does only a little checking.
>
> I won't comment on the mlx5 case in particular, I don't have enough
> knowledge to do so.
>
> When it comes to validation of commands by the kernel, at the very least
> the kernel driver needs to be able to guarantee safety. For instance,
> that means that any command that can result in DMA operations need to be
> validated (e.g. verifying buffer addresses and sizes) and/or executed
> partly by the driver (e.g. mapping a buffer through an IOMMU), depending
> on hardware constraints.
>
> > There is a 12kloc file describing the layout of alot of commands:
> > include/linux/mlx5/mlx5_ifc.h
> >
> > There is an open PDF describing in detail some subset of this:
> > https://network.nvidia.com/files/doc-2020/ethernet-adapters-programming=
-manual.pdf
> >
> > There are in-kernel implementations driving most of those commands.
>
> For camera ISPs, most of the "commands" wouldn't be driven by the
> kernel. I don't have expectations when it comes to what commands the
> kernel exercises directly, I think that highly depends on the device
> type.
>
> > Other commands are only issued by userspace, and we have open source
> > DPDK, rdma-core and UCX implementations driving them.
> >
> > ie, this is really quite good as far as a device providing open source
> > solutions goes.
> >
> > However, no doubt there is more FW capability and commands than even
> > this vast amount documents - so lets guess that propritary code is
> > using this interface with unknown commands too.
> >
> > From a camera perspective would you be OK with that? Let's guess that
> > 90% of use cases are covered with fully open code. Do we also need to
> > forcefully close the door to an imagined 10% of proprietary cases just
> > to be sure open always wins?
>
> For command buffers interpreted by a firmware, it would be extremely
> difficult, if not impossible, to ensure that nothing undocumented is
> possible to access from userspace. I think we have two issues here, one
> of them is to define what we required to be openly accessible, and the
> other to avoid vendors cheating by claiming to be more open than they
> actually are.
>
> I believe the latter can't be solved technically. At the end of the day
> it's a matter of trust, and the only option I can see is to build that
> trust with the vendors, and to make it clear that breaches of trust will
> have consequences. A vendor that deliberately lies would end up on my
> personal backlist for as long as they don't implement structural
> solutions to be a better player in the ecosystem. What is acceptable as
> consequences is for the communities to decide. We have previously banned
> people or organizations from contributing to the kernel for certain
> periods of time (the University of Minnesota case comes to my mind for
> instance), and other options can be considered too.
>
> As for the first issue, I think it's a difficult one as it is very
> difficult to quantify the features covered by open implementations, as
> well as their importance. You could have a 99% open command set where
> the 1% would impact open implementations extremely negatively, the same
> way you could have a 50% open command set where the other 50% isn't of
> any use to anyone but the vendor (for instance used to debug the
> firmware implementation).

It is not that difficult. You just have to define what an acceptable
implementation is. Eg

- Sharpness at specific light.
- Time of convergence for the Auto algorithms
- Noise ratio

We could even use the SoftISP implementation as reference. Is this ISP
working better or worse than SoftISP?


>
> For cameras, the feature set can I believe be expressed in terms of ISP
> processing blocks that are usable by open implementations, as well as in
> terms of the type of usage of those features. For instance, is it
> acceptable that a vendor documents how to use 2D noise reduction but
> makes 3D (temporal) noise reduction available only to close-source
> userspace ? My personal answer is no. I want to aim for very close to
> 100% of the features, and certainly 100% of the "large" features. I can
> close my eyes on features that are very very niche, but what is niche
> today may not be tomorrow. For instance, if a camera ISP implements a
> feature used only for very specific camera sensors targetted at
> autonomous driving in a new generation of research prototypes that only
> one company has access to, I'll be inclined to ignore that. That
> technology may however become much more mainstream 5 years later.

We can update our requirements in 5 years. Nothing is written in stone.

Also it is much easier to reverse engineer an open driver, with an
open userspace and a closed userspace than a close driver with a
closed userspace.


>
> The other aspect is the type of usage of the features. For camera ISPs
> again, some parameters will be computed through a tuning process, and
> will be fixed for the lifetime of the camera. I want those parameters to
> be documented, to enable users to tune cameras for their own use cases.
> This is less important in some market segments, such as laptops for
> instance, but is crucial for embedded devices. This is an area where
> I've previously been called unreasonable, and I don't think that's fair.
> The tuned-and-immutable parameters are not plentiful, as most of the
> tuning results in data that needs to be combined with runtime
> information to compute ISP parameters, so the "this is for tuning only"
> argument doesn't hold as much as one may think. For real immutable
> parameters, a large number of them are related to image processing steps
> that are very common and found in most ISPs, such as lens shading
> correction or geometric distorsion correction. I don't see why we should
> let vendors keep those closed.


We don't have enough leverage for that kind of requirement.

To be fair, we do not ask touchscreen manufacturers to document their
calibration files. Nor any other calibration file in the kernel.

The calibration file for me is like a firmware blob.



>
> I'm sorry that this discussion is turning into something very
> camera-centric, but that's the relevant area I know best. I hope that
> discussing problems related to device pass-through in different areas in
> the open will help build a wider shared understanding of the problems,
> and hopefully help designing solutions by better taking into account the
> various aspects of the issues.
>
> > Does closing the door have to come at the cost of a technically clean
> > solution? Doing validation in the kernel to enforce an ideological
> > position would severely degrade mlx5, and would probably never really
> > be robust.
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

