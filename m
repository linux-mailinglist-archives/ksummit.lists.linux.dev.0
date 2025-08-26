Return-Path: <ksummit+bounces-2224-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FEDB373A2
	for <lists@lfdr.de>; Tue, 26 Aug 2025 22:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B96407AB46C
	for <lists@lfdr.de>; Tue, 26 Aug 2025 20:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C179E30CD91;
	Tue, 26 Aug 2025 20:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Xj6zPme+"
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F5D3164C6
	for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 20:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756239158; cv=none; b=fA5VnbpwCqLTp2Ue2rehV8eQc8oUI/hBDxkOyL/ChBCnDpI/XvEDN3qD/eZgNT7PxRW1sAKiuLV65WFExe8PMuUTYtS1kKP28/19li5Lsi8SH4p7C/nP0vwqpVxWYI5I64nZLYFndD1cO8GlEVqybiMMbgzcajg+R8Ewsnt8X2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756239158; c=relaxed/simple;
	bh=5LK3/+NivPONmiRRG5m6R//DxXYodCXwnIUiz0u1YsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuHnYpvcqanTG+siM7b1s5GMrR1gF/Y6me6Kg391joh28UJAh8Hlzv6lkJ04lk7JEsCIY+uOfBMTak3fpHdBk9fcPPSpdENWA8j23OBqJJVV/Nl2PicSBUt8y8h5snCsYo+KxVtJ53yVo88WW3rrZonjAK7SxZpYhCVytt6rG94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Xj6zPme+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afea7e61575so144835866b.2
        for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1756239154; x=1756843954; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+0SlNe/7MkVJSUBe/QJDCMcn/Cx/K7+yLMBEsDkZHKQ=;
        b=Xj6zPme+ctFfcTA7/pykGiIFoVjcMnBzxC5+X5PSbJUyNVJEU8ZyDrprX6YRPj3UPg
         m0Z+AqMP63PRaQeQe30jcH7xyEf60/51WVERdCmZAyHXl8K9fIz8TkUj0gjaSfFlusT4
         nh26EY7fLqOV2AutGe855botwWHclstBgcQgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756239154; x=1756843954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+0SlNe/7MkVJSUBe/QJDCMcn/Cx/K7+yLMBEsDkZHKQ=;
        b=FJL1sBleelSePeRDitTEw4PtxTqhkp/feL5/njOzvGkM1+RsL8yhirbTkcWs8y0EZ9
         cfObI/0fLbpW9IrZx4TAg95wfqjT5RW24ClrQ4QbjOJy3m41/Q8PrJ9cIVmZWZDSgrlP
         MRJ9j94j3F5WjLmpfPFTmAe0R8OYq9YXW2CSirz47iSXiGW2KaeDwfN6UADjgCDotVMF
         nqGc8uzHZ+PRZayxRRaIyPbdEOCTQOwUaroFaO+H0JqqoSnAnDaRU3CU9+bL1GXEg9D1
         Y4nD4nvXpbssnVu1OMAiR/qAXIrmLFwqnEruUu+E5AWD/a3KxGVhCU9K3y7qbQDl5qVK
         +dpA==
X-Gm-Message-State: AOJu0YzZgkdgq3JZG8NH2Vxj/eX7teM+WqMzqY7mZRV7IsK1Lbsrlrf3
	yEQKqLgE+B5fW60oBZq0bSiixiopakeArf7Zq0AnQSYJKscEyfRSxXP5WhTYKkeCeU84DmHJEcw
	tzYoxVXk=
X-Gm-Gg: ASbGncuMnqa7LDqMKyobHRoCpB3YWz6VHstwOyYQRRq0kizEUFyGawNkRfO8RKwAVlG
	Z7ig+usZNcG0QtVebZ3aW3WTu49fbip8PDuyn2vshB84tAs0pHpcfc9oF8DAS8erv+lxfPCIIfq
	DjLhcTEpOeK5itRj8hi9MUFzTaT5h1UWNvka3Ycmw9indsGE2HnQLS1ix5V3wnT8FGWfBLtozZH
	sODxmdttxw4rOJ446Ben8Y0r9rWS434CalMM16jG3OcE+n+aQiZX2FRZxxfGckrppQfl8dFwO6x
	QOeDusQ/vaBv2od2xMjhL8YWw2VM8cVT4csGaZJ2M675sDgXOwLLmU3xFFflzUTQM/uP0A/imGT
	XjutwIFzQBYuaqmnfByMDWMHRU2cdp+FvdWDc2GQD+qIRjh5Kzn9jzZj7nrk4c+Rm2RNfNASO+c
	qKjoSGxUA=
X-Google-Smtp-Source: AGHT+IFSu4w0XC2mDftV+Ys1CQXnli0Stpu5jAWBz4hfkzAzxx6xTN7n80CZNA15HDpOOOeHFWksKw==
X-Received: by 2002:a17:907:7f9f:b0:ade:79c5:21dc with SMTP id a640c23a62f3a-afe2901b543mr1651091666b.25.1756239153544;
        Tue, 26 Aug 2025 13:12:33 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe88c76f61sm430282466b.10.2025.08.26.13.12.32
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 13:12:32 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61c26f3cf0dso7021026a12.1
        for <ksummit@lists.linux.dev>; Tue, 26 Aug 2025 13:12:32 -0700 (PDT)
X-Received: by 2002:a05:6402:4406:b0:61c:527b:150c with SMTP id
 4fb4d7f45d1cf-61c527b16a5mr8286854a12.32.1756239152367; Tue, 26 Aug 2025
 13:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
In-Reply-To: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 26 Aug 2025 13:12:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
X-Gm-Features: Ac12FXyBlzqtzuTzRXdOLCneWioHEvPkLOJrzETwof11G_qlKQD3MEz6Isnp5EE
Message-ID: <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Aug 2025 at 12:58, Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:
>
> 1. Use gcc's __attribute__((deprecated)) (Linus doesn't like it

No. Unacceptable. We do not introduce warnings that aren't immediately fixe=
d.

And no - this isn't even getting discussed. The kernel stays
warning-free, which means that "__attribute__((deprecated))" isn't
something that "Linus doesn't like". It's simply NOT AN OPTION.

> 2. Use keywords in MAINTAINERS entries (this sounds like an abuse of
> what this file is really for and can sometimes be hard to get right.
> Also: see above about it not being very efficient).
> 3. Make checkpatch.pl check the patches for new uses of deprecated
> APIs (similarly to what it does for invalid usage of memory and log
> helpers)
> 4. Make build bots detect it.

Fine, but doesn't solve anything.

> I would like to propose a discussion on how to enforce API deprecation
> in a way that supports efforts to reduce technical debt, without being
> hampered by developers and maintainers who mean no harm but simply
> don=E2=80=99t know any better.

Here's the only thing that works: if you change the API, you have to
fix up all existing users.

If you are not willing to fix up all existing users, and you introduce
a parallel API, then you are the one that maintains both the old and
the new API forever.

Or at least until somebody else did the work that you weren't willing to do=
.

End result: the burden of new / different API's is on the person
introducing them. IOW: don't introduce new API's unless you are
willing to support them.

             Linus

