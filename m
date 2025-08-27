Return-Path: <ksummit+bounces-2230-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFDDB38555
	for <lists@lfdr.de>; Wed, 27 Aug 2025 16:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2464016B2C7
	for <lists@lfdr.de>; Wed, 27 Aug 2025 14:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF2421770A;
	Wed, 27 Aug 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fIZPGON/"
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E278F3A
	for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756306039; cv=none; b=p5QmV8ZiW1D1WnGMJ92UWEMvUFmbFm5X2J+YpMBhpgjqIFfFP0uOQ3NRCIHEWcmd/x3xNbYY3Qg7XF4gjJCrvPlZ9lDMWsCMr0o/B8QlnIww3b3cHaxl3OzZLXXA5iqoUPQPoldSqQBNbCpdQsoiLhRtXRc/PpjLgwoCpUUYJ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756306039; c=relaxed/simple;
	bh=UCsLVrkvqGEmJCj+NeBXgNvebYx6yJOhSbPIC7+AY70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSiqhmOGfyBCnGlUn4B4v6gz3m0LJTgEVV1rWm/z/rI7PG9qwo9uy0QscHVcfF0K/W/jQrr+1fac8enASa9uYOJiiQSkbHRlaILZGM89ZsPhMIywZ+3fdvcn02nSXeHkTbX555PVyxrXOQOetU3z11tCrwlGw5Lc5SaOYihdxmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fIZPGON/; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7347e09so1196752366b.0
        for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756306036; x=1756910836; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCsLVrkvqGEmJCj+NeBXgNvebYx6yJOhSbPIC7+AY70=;
        b=fIZPGON/8F0r2HA1vu4nkTrke9+lRPk0MolzfWmwwoNgmj+Q6pPn5fzVljY8sf7oJi
         Ca3e28HsmZ/IuFGSY/BgHqM1At55y9W507b5JyLjUtMj8PwtprpqLA/z+POsf1pD8FKT
         omfVIWkQDxnjeT1wPtCLMzhagN4Uba7M9JATPkyofyhADxX3PD+Auk8BljLsKCD9kDLy
         VStkAZOko/Krsnhy5RhjWPkZkg3bM9lJcT5L5H+oNi8s4NQ9P6QGLMUzHZsViUH2JjFl
         UWr7y4xwhzn2xRWq54wY+IN6GmZeWOJhqymUjowh6PfpI08ocMGe13//qIe4lxo1SoTJ
         gFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756306036; x=1756910836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCsLVrkvqGEmJCj+NeBXgNvebYx6yJOhSbPIC7+AY70=;
        b=A04c+LGW0dnwPvTrmOG567S/bQTS79WNnab4jZVNDooS7Fs76RJU1HvYSmXGRRAgCz
         soJvzFbTT+69234YVRD85Jyp1rTPLL+IObCVg+DKESvkK1qtb4mpnGaTYMxIeOMQVS7/
         uVLmhd1uvlPpDPTwHDFRzozMO8d5D9pg4xukyL4YATmQJqJL0fXzvPZUvVz0xEyeLxbD
         5lGYVVYK6O24ugYqoqZZAE1+ntP7/UYWeEI5vihPJfRcCWgsl2dlIeNY1+3G61mfA+kb
         TKjsFL4X0zvf9Csmlvdgrt2JInYvsTa6ri20a6U+M7ZMxHOnXR/OWX4/7l36VdoS3em/
         i2og==
X-Gm-Message-State: AOJu0YxGNaVe3OPFv0ADaMGEJPMQ8+gT2EYMznjANdcmbjH7Q7bOGu09
	CxeGt4J0BtCh4SssiKzZMVSwJwrzmJ6pLoQypthB7bi7VomP4wW8Plv7mrYghR8n91YGNFW6ciq
	tUvwpikVRxfyHCuqwEf721BuLl8KdNw7k6r1hibG1V+Kc/RkB0VUsSV4=
X-Gm-Gg: ASbGnctVGqMG3sSD5NO4PliJwXJbIFbLYZdtwvHM59uen9LiagmAJUX59vLE+RfXRkq
	nFJq/JypnWAdVXD7qKtWikqHZ2w1ubs0aZnFog3+5OiluTXo1SUAOPAStDqyFfAZggiIcstM5Jl
	pTKxIu1T9c6vYLuDas9Aawmc2ldvY432xR7d1x80vJbFeh7PdBPIq3DWNsXCdKOCnssdrMSO0b8
	bjWJ2ou+XfqkxDm+QYRONXrg2pdzLluYU+3k/Q=
X-Google-Smtp-Source: AGHT+IHbGd6XfFPER2AWQ4g0DOMvXtpqKhlVF7ZXrjQd7lL+ytR66qcuTU2/ffWy51D4h26OHls0pyF9g/WJgumas6Y=
X-Received: by 2002:a17:907:846:b0:afd:d20c:8657 with SMTP id
 a640c23a62f3a-afe28fd4617mr1713827166b.21.1756306035806; Wed, 27 Aug 2025
 07:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
In-Reply-To: <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 27 Aug 2025 16:47:04 +0200
X-Gm-Features: Ac12FXy14-sCyWBPsDZd1RHIypY2siHNQjowvJEROY1ZrR-G6xhAy845R-T_Qk8
Message-ID: <CACMJSet5r0PDFsYRcNWKQH_jfimqpQWZ2nL2YKoc-+QisNNykA@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Aug 2025 at 22:12, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, 26 Aug 2025 at 12:58, Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
> >

[snip]

> > 4. Make build bots detect it.
>
> Fine, but doesn't solve anything.
>

How so? The developer gets an email telling them they used a legacy
API, the maintainer sees a build bot report and knows to ignore the
patch. That's already better than what we (don't) have currently.

> > I would like to propose a discussion on how to enforce API deprecation
> > in a way that supports efforts to reduce technical debt, without being
> > hampered by developers and maintainers who mean no harm but simply
> > don=E2=80=99t know any better.
>
> Here's the only thing that works: if you change the API, you have to
> fix up all existing users.
>
> If you are not willing to fix up all existing users, and you introduce
> a parallel API, then you are the one that maintains both the old and
> the new API forever.
>
> Or at least until somebody else did the work that you weren't willing to =
do.
>

That sounds great in theory but in practice, one may be willing to do
the work and it will still take years (as is the case with GPIO) where
there were thousands of calls to the legacy API and - due to the
nature of the differences between the old and new one - the
conversions are far from trivial.

I'm not advocating a policy change, I'm trying to bring up the subject
of making the effort easier for those who participate in the tree-wide
refactoring.

> End result: the burden of new / different API's is on the person
> introducing them. IOW: don't introduce new API's unless you are
> willing to support them.
>

I would assume, kernel developers in general and maintainers in
particular want to make linux better. An old API may have been
introduced long ago in times where we didn't know what we didn't know
(or even implemented by completely different people altogether) and
the new one, implemented later, is objectively better.

Sometimes a new API is close enough to the old one, that it can simply
be wrapped in backward compatible inline functions and the
implementation is the same for both. That's awesome and supporting the
legacy interface is not a big problem in this case. However, in other
cases, the underlying change in philosophy can be so fundamental that
we effectively end up with two intertwined implementations where a lot
of code could simply be removed once we unify all the users. In our
case, the work IS happening and several people are contributing. My
point is: this effort is commendable and should be supported rather
than brushed off with a "that's the API's author problem". I'm sure I
don't have to even name the advantages of having less code to
maintain.

And to address your last sentence on a personal note: thing's arent
always so black and white - for me: I inherited the GPIO subsystem
with both the old and the new API already present tree-wide and am
just trying to improve the pre-existing situation.

Thanks,
Bartosz

