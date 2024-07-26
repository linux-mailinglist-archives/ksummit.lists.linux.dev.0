Return-Path: <ksummit+bounces-1492-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E693CF41
	for <lists@lfdr.de>; Fri, 26 Jul 2024 10:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A81B282D47
	for <lists@lfdr.de>; Fri, 26 Jul 2024 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26835178395;
	Fri, 26 Jul 2024 08:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YMFjmq7p"
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E9D176ABA
	for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 08:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721981108; cv=none; b=fER2GXuuFYISQ+eQUHNqEMrnltSDuqnR/biXY6xEnW6MigMOKoqOF+oGbNkqNvE+bW3xxAku/MDC87A/ZPqPp2p8cw9Ed8PPsYdVbQNniZH3trwUOe9JlVCEBLhKh1+Fr+mX5NJKthwtq/Ltzt4IBm4vx523YOHCSzgy5G52eUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721981108; c=relaxed/simple;
	bh=GfulG0t9WbtzwIHjpbSdV8fiy8kLPHEJcxxQ+VKbRbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nC6ATyCf/AXAdpvFHdcNx7H8pJEoBv1JhwH9Ig5JTAaDoq62kPkrExNC7tO8fK0HTcK/jI93jyLYl44kDiDvcwlR4v6M9pmNg1a8gAqHVxw0Ps5ROZFb9hLGJVu6tQLUKgjNFdOENCn6JAXH5hmh3LDi0ikVXdEtp6sk+mSu3eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YMFjmq7p; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4928e347ac5so486335137.3
        for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721981106; x=1722585906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfulG0t9WbtzwIHjpbSdV8fiy8kLPHEJcxxQ+VKbRbk=;
        b=YMFjmq7pwztK9owLMZyuSgfYnewOykE/C4C5c116b2TQhPorM3h8vPhUGiamitFjjf
         LTKT1TPSJoT5lFnmLO+LXx/DiritEkHl91HD5Zq+fHH19xiCebcnJmEaldoUtuz+c78W
         YrrJh1Kk8nTZZL68DQwnFUuvloOMvTRUgtI/ZScO2MZmB6MvRz+HqK2CynTJ8ETRQaDe
         KNyuFUAWw66pG/kEADV544yLMex1vNi4gREK+niZqZ9wM8qqkcJES4O+bwWvSMX05xr2
         H0QwxOKBFFnDRBkxy0Q882Lx45ozLprSAeIvLgOKnzKFPHTJdEogp5W3elnKFNh6nG3r
         fKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721981106; x=1722585906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfulG0t9WbtzwIHjpbSdV8fiy8kLPHEJcxxQ+VKbRbk=;
        b=U1uj3LPqVhtrjrwrKjTRz5VXK2H7wv0+W9TFRyBGng8jdPNm1hxDbEda7tcBhjUEPX
         xcjY2+Jr6r2s+in+UUOh7dAV/VppTdbzZL4i3UUZZcwFCKU+d6jLp8pGTEJCcuWOhCMu
         Iw8Etx40bzPAbxI4GvsyGGKzwn9BiJRV8EPp0//sD6mQg2FDvMVoInZw2P2Gg5PS7Vza
         NwGpNj19cChVKJol7YhopYBv8Wn5ESF6GzyvCME+cD43QFwlBNT8qDtiKpYArPoeKLcJ
         Dptj3o8Jqsa9dqUnYkudA8wCpVprMiB+WzuAZTEowl1+jkfnu0yuar3dodQ1PlXJs0wr
         mkLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPMttNwIhq7YkZQbk3wcp/dOt1SmMzNnygWn/v+FV+2l9EydHgm6OjNFUSaoOOpvfManCi49bHzQj2LfnIv9ltV1PQ7Hlzpg==
X-Gm-Message-State: AOJu0Yzwf98afqDemEY5eN6GHWfNZEMJqkGtN3jwrU0VGY+8j0Fy0QKm
	C7c0u/gGnSkhmd/ZOi0uH/+lwUHCMwcuKSWU5gdi9wS1m1x3/XNcNA7JszjNUKDn42LmjDCo4nF
	SBpef8GvrVEHeHYIIIQ+7cJqXCBM=
X-Google-Smtp-Source: AGHT+IER20+OH20FeNofjZbNSg5YSO4uu2dsN1XaOxb4vENmdqxfMdxAVIy8F71gyOTt7gr/ZbKk6MdsE0ObKrXjlQk=
X-Received: by 2002:a67:e708:0:b0:48f:4778:9299 with SMTP id
 ada2fe7eead31-493d9b6d27emr5949947137.28.1721981106078; Fri, 26 Jul 2024
 01:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <nycvar.YFH.7.76.2407231320210.11380@cbobk.fhfr.pm> <1e82a5c97e915144e01dd65575929c15bc0db397.camel@HansenPartnership.com>
 <20240724200012.GA23293@pendragon.ideasonboard.com> <a75782218f34ae3cff725cbcfb321527f6aa2e14.camel@HansenPartnership.com>
 <20240725193125.GD14252@pendragon.ideasonboard.com> <20240725194314.GS3371438@nvidia.com>
 <20240725200703.GG14252@pendragon.ideasonboard.com>
In-Reply-To: <20240725200703.GG14252@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 26 Jul 2024 10:04:48 +0200
Message-ID: <CAPybu_0C44q+d33LN8yKGSyv6HKBMPNy0AG4LkCOqxc87w3WrQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Jiri Kosina <jikos@kernel.org>, Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent

On Thu, Jul 25, 2024 at 10:07=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jason,
>
> On Thu, Jul 25, 2024 at 04:43:14PM -0300, Jason Gunthorpe wrote:
> > On Thu, Jul 25, 2024 at 10:31:25PM +0300, Laurent Pinchart wrote:
> >
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
> > If someone came with a fully open source framework for (say) some
> > camera,
>
> We have such a framework, it's called libcamera :-) Multiple vendors are
> already collaborating.
>
> > with a passthrough kernel driver design, would you reject it
> > soley because it is passthrough based and you are scared that
> > something else will use it to do something not open source?
>
> It depends what "passthrough kernel driver design" means. If it means
> accessing the PCI registers directly from userspace, yes. That's what X
> used to do before KMS, and I'm glad it's now a distant past.


Nobody has suggested giving PCI register access to userspace.


>
> If it means a kernel driver that takes the majority of its runtime
> parameters from a buffer blob assembled by userspace, while controlling
> clocks, power domains and performing basic validation in kernelspace,
> then I've already acked multiple drivers with such a design, exactly
> because they have open-source userspace that doesn't try to keep many
> device features proprietary and usable by closed-source userspace only.

If that was an option we would not be having this discussion.

Vendors cannot have vendor access in v4l2.
"""
It is not an option to upstream a driver that has support for
undocumented closed features. Basically maintainers can't put their
name on something that contains unverifiable (for them) and unusable
(by all except the vendor) features.
"""
https://linuxtv.org/news.php?entry=3D2022-11-14-1.hverkuil


>
> > I wouldn't agree with that position, I think denying users useful open
> > source solutions out of fear is not what Linux should be doing.
>
> --
> Regards,
>
> Laurent Pinchart
>


--
Ricardo Ribalda

