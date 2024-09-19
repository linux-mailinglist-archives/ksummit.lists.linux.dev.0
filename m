Return-Path: <ksummit+bounces-1574-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A3997CB37
	for <lists@lfdr.de>; Thu, 19 Sep 2024 16:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC2EF285D17
	for <lists@lfdr.de>; Thu, 19 Sep 2024 14:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547ED1A0708;
	Thu, 19 Sep 2024 14:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izlh39Wu"
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1296C1A00D1
	for <ksummit@lists.linux.dev>; Thu, 19 Sep 2024 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726757774; cv=none; b=XzZiir7Oa3lSMfMYlZGodVGf9P1a/iCEcBeddAHAMzoGB2jluphOHvkj2SHLIMy7+48oT7tLP/EmK4NmkKKPkVAUQX5lhjybL1sLL+riKcRdhtGIDBoQpWMM9gEdPNpsIQWyky6sH0QAtzoIFNCXbPFA6wbIN0oE717X6kWksKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726757774; c=relaxed/simple;
	bh=djrqINnlULAZm69P41FsjbyR6Ic+oL4n9DYbSLY+vhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U7m6grAzdfsq0g0+Tt7/XosxiiyiB+UnAjEp7U7kr9dl82X1gUgw4MXb08Kt/M0y3Dz3y1lK03aOZneCRqSJeYy3atyxCDDZ+SNApFoarJ3l6WAcMTjD6/w089ozg+WsXstnSbgKQQyX3Pg8LgYLaZnmPsY5o1/HLfDolckQhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izlh39Wu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365c060f47so1206590e87.2
        for <ksummit@lists.linux.dev>; Thu, 19 Sep 2024 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726757771; x=1727362571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djrqINnlULAZm69P41FsjbyR6Ic+oL4n9DYbSLY+vhg=;
        b=izlh39WuaqyXGDR9D5AFzJtJ32hYdHkpi8SyvwKKeAqLehtmig5ou87BGprEaHRJbH
         1I8D3flRG6YGhQnb591TD/fxXVtPPhHIwGCLlhM5ptdJXimewUOWjcWwYnkvdYk26xtD
         mhVRS2Hy0hxF6pA3oW+cIc68Pt14N+NgnUQR55Xy65ipYwvqz4jwKLoLFu/5QcFJuJTZ
         jlx5Amm2dSAWPqe/MFeIwy8amjRNvxFUYeHZu7zwLgUCWRvqowX2utijvzhPjiHf29jn
         HUmsVZFUVoUhb8yMRR+xL5IYxsENHYjZ4lmDzjcqn9EoJg0lbDwgS/HXiaM6tJh9Fwdc
         xPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726757771; x=1727362571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djrqINnlULAZm69P41FsjbyR6Ic+oL4n9DYbSLY+vhg=;
        b=N3TO8V4O+jxg21PvgYU7tlP2B0oEGMQvO2dy1JUV6IIPECVlWrLlD2vfVkr4xt+7yI
         hQNVI1sHTY9irfEC8Nba4Nr720fQyeINGKTKZ7JfexKP4MnxR8DMOL2G2xAH8mHFyIXf
         wf5dHxXYQ0R+JfkcLAD55MB6HT8KITditYO0fpwdlrOZ6swaQwHV/2Cio6XWm6RLlLl2
         OmOTVk/dUqWGUgzMMxGboYe25W/ecKmIg45cetmlMFbaNco1ck6CTWA8LyWMehU6xhCV
         747EMYv5GlXhBjikvINr7R5b9VSZkyibERmqDFyVrTs6K5oUXiQSKXHJUkURAZ5M70DM
         dBGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+robxiP5II/qwqVnL06RcNm5sriXHn3E4qsuWh/FnHSa7/glTWbG0fJlTmeB/Q0Md000iC1q1@lists.linux.dev
X-Gm-Message-State: AOJu0YyvvhUMw/5N0haRmBlufvdA7Hpe5GNHoYBUYs3PHaYYdb68OgdL
	h6j7mva/kh3pUv/wZyp57a4zuvFgf0QSq3Tc/mIvaBmKeR58p7Slhxl5PDSEwurVxPPgX8xqDX9
	dLB9U/uwH8kmr56tVOssIRVNmZw==
X-Google-Smtp-Source: AGHT+IEbWCfyi4PLj9eKnpefCCExm04YxTqzH9zku/rf6PWY4DpfSIbv4ce5nCusEMNjNEyCC0fj6lx9qJS1pgCU8SM=
X-Received: by 2002:a05:6512:ba8:b0:534:5453:ecc8 with SMTP id
 2adb3069b0e04-53678ff5e11mr16365913e87.52.1726757770815; Thu, 19 Sep 2024
 07:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <972ed553-c917-41d1-be6e-b8a3ab90b66a@arinc9.com>
 <CAL_JsqJ8JUZi1YUNv2rB-4PqrLvykm+OATkg6zb5q6E2_WPqdw@mail.gmail.com>
 <32400a92-23c0-4ec3-9e42-29074e6db1f5@arinc9.com> <0ebbade1dd90305b4abf1315a2735f7f7caa81bd.camel@infradead.org>
 <074766B4-C125-4514-B57D-043473819A0B@arinc9.com> <20240913-elective-barmaid-a15b56b5dab7@spud>
 <a4ba75e1-0a49-48eb-91b2-cb701b211710@arinc9.com>
In-Reply-To: <a4ba75e1-0a49-48eb-91b2-cb701b211710@arinc9.com>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 19 Sep 2024 09:55:57 -0500
Message-ID: <CAL_Jsq+2882SR+kvSx9no2PYavEBRX2Sr+jFtH8U4F+_1ZMUUw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] State of dt-bindings and DT source files,
 and invitation request
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Conor Dooley <conor@kernel.org>, David Woodhouse <dwmw2@infradead.org>, ksummit@lists.linux.dev, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 8:49=E2=80=AFAM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.un=
al@arinc9.com> wrote:
>
> On 13/09/2024 19:13, Conor Dooley wrote:
> > On Fri, Sep 13, 2024 at 05:38:44PM +0200, Ar=C4=B1n=C3=A7 =C3=9CNAL wro=
te:
> >> On 13 September 2024 10:08:41 CEST, David Woodhouse <dwmw2@infradead.o=
rg> wrote:
> >>> On Thu, 2024-09-12 at 15:57 +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote
> >>>> Over the course of years, I've had maintainers resisting to or compl=
etely
> >>>> blocking my changes on the device tree definitions because of Linux =
driver
> >>>> related reasons. I couldn't have patches that fixed incorrect hardwa=
re
> >>>> definitions to be applied, because the maintainer would demand a cha=
nge on
> >>>> Linux driver to happen beforehand. I've stumbled upon misconceptions=
 such
> >>>> as thinking that a Linux driver change could break ABI. In reality, =
that is
> >>>> nonsense because a driver change represents the implementation being
> >>>> changed, not the bindings. The implementation change can only be so =
that it
> >>>> breaks compliance with the bindings.
> >>>
> >>>
> >>> We should be careful here.
> >>>
> >>> The device-tree bindings are the definition of the ABI. But they are
> >>> only words; what matters is the interface between the DT blob itself
> >>> and the OS drivers which interpret them.
> >>>
> >>> If we want to *change* that ABI in a way which breaks users of it, th=
en
> >>> of *course* we have to consider a transition path for those users.
> >>>
> >>> That's true of *any* ABI, be it a command line, a library ABI, or the
> >>> device-tree bindings.
> >>
> >> First, let's agree on the two cases of changing the ABI. You either ad=
d
> >> new properties and rules (let's call them definitions) to describe the
> >> hardware more in detail, or you change the existing definitions which
> >> would break the ABI. As it's irrelevant to my point, I'll simplify the
> >> valid reasons to break the ABI as: The existing definitions wouldn't a=
llow
> >> the hardware to be properly described.
> >>
> >>>
> >>> So where you say, "blocking my changes on the device tree definitions
> >>> because of Linux driver related reasons", that isn't necessarily wron=
g.
> >>> A breaking change to an ABI *needs* to have a transition plan for how
> >>> its users get from old to new without a flag day.
> >>
> >> This is a concern for the Linux kernel. If we demand the compliance of=
 the
> >> Linux kernel with the changed device tree definitions from the people =
that
> >> made the change, then we can't talk about a complete autonomy of the
> >> device tree development from the Linux kernel development. I should be
> >> able to submit patches with the only goal of adding or fixing hardware
> >> definitions. Either I've broken the ABI with a valid reason or added
> >> hardware definitions, I must not be forced to do Linux kernel developm=
ent
> >> for my device tree patches to be applied.
> >
> > I'm going to require that it is done, by someone, before I ack a
> > dt-binding change. I'm also going to require that it's not breaking
> > other projects, like U-Boot, that pull in the dt-rebasing repository.
> > If you change the ABI, and therefore change the source files, you also
> > need to change the users.
> >
> > And I would have those requirements whether or not the bindings lie wit=
hin,
> > or outside of, the kernel tree :) Suggesting that decoupling the bindin=
gs
> > and kernel would allow that to be relaxed is, in my view, silly - it
> > would just prevent anyone from being "blindly" able to pull in whatever
> > the latest revision of platform devicetree source files is, without
> > substantial risk of regressions. That's a downgrade from the status quo
> > in my view!
>
> I agree. I have an idea for an approach that will keep the status quo and
> allow us to have proper device tree bindings. Allow changing the device
> tree binding documents; require the driver to be tested and fixed only if
> you're changing the device tree source files. This way, we will have prop=
er
> device tree definitions without affecting the users and have upcoming
> drivers implement the proper device tree bindings. The non-compliant devi=
ce
> tree source files will get a nice complaint when checked with the binding=
s,
> encouraging to fix them.
>
> We explain on the kernel documentation that if you change the device tree
> source file to be compliant with the binding document, you are required t=
o
> test the driver and let the maintainers know that there are no regression=
s.
> If there are regressions, a patch to fix the driver must be be included o=
n
> the patch series and come after the device tree source file patch.

This is not how an ABI works. If you have to change both sides for
things to work, then you've broken the ABI.

With no ABI, the order you suggest for the series is backwards. The
series is not bisectable. That assumes you mean the driver change
supports a DT with and without the DT change. If not, it's just
completely broken.

Rob

