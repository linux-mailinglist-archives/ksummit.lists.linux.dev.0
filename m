Return-Path: <ksummit+bounces-2235-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEBAB3881E
	for <lists@lfdr.de>; Wed, 27 Aug 2025 18:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2B483B5F9C
	for <lists@lfdr.de>; Wed, 27 Aug 2025 16:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8782EA72A;
	Wed, 27 Aug 2025 16:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MHzZ3ttk"
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B5D225761
	for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756313886; cv=none; b=g7Rb27fz/fAdRR8mOtIROKlVxyC0wWMGk0XNhuw0dbp7VwCF+kixliW25kSxHDbhxeGY5Sd0/+Tdvx6FW7abJRayhhbdT3WGCXD+rydruOKuXwj4vAYZcR+W7C6LEVAB5LvpT7RWH8+54FWNyfOP7G7yRX6/k/yY701tcqxA8Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756313886; c=relaxed/simple;
	bh=tffF2EJOkKksQuVcfYK5ffZtXu2lTRTUY5QG28Y1xS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFigDIb9Q8NzWOHBVCDJWxzrckmFcpczEeFaKflTErg9qp6CmzyF7mL9RvELpNS1dVnFwrl36lXrmlsqsktCufoAvdcjYVvwxpz8577nSaIfQGcCjqi2XS5gQNFQ3vex0V+zVRpUptDxEaWCr9X9oq+IxjRTF6dKf3TPkG0ge9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MHzZ3ttk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7a3a085so565666b.2
        for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1756313882; x=1756918682; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HyLDuXPt5Se/Z8URF92NqrT+8rMt1jc/uWNVhLl931c=;
        b=MHzZ3ttkXXyve2tYGkB8aTlYzYkuJpdtMfsf6rxSjdPX2aUTbD/5nVnk+Noe4za4RR
         gYgsdCq1v9kiVQtBurNQzfJPIrxWf9/yoofkYjvlUg6UKL12eQMib+4BaEKatppY00On
         1DdoXFWtH6jdLIpd+TBqAdUB31VUndCggOM7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756313882; x=1756918682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyLDuXPt5Se/Z8URF92NqrT+8rMt1jc/uWNVhLl931c=;
        b=hZIdOX43jNUGIxzsih6DoKTlstUmSuDMKcztbUTbh168QWicgcicefJy5JW1IvCvYh
         8gLPQpDo0KBg7crErKfPh1Vj9ubFTWm+hSCIqsOatnbalMTSmJZ3neT+xWErpoHWzwx1
         GTaMo+dLyn+50nV6V78C9NqbtvMVIeKsXKEWtSxvUEgtuE1Mucqn1wAD4Q9ie4d/QHbv
         c4PV7RBzDS4w/KuxE+D7wilJVg4G6a0SdtReWRZLe2gOH0isHQVWktJKU7pvCZaucF6t
         LD5kYR4+VARSjvwDE0qvRVv3M6BBW6nD+Bbx0v4aY4oTVyIShNtFcB6wneHr3KZBmYiU
         UCjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsxFS8ye6PxHL6ATijma+TeDfdkMLQVXP9/mheNqwDDbq8cPeCvOToVQ6SQGYh2FZvE41L2AT4@lists.linux.dev
X-Gm-Message-State: AOJu0YxCVgpAO1SUhxAaipS0C5Dn57PE9skJLKy4DaCtjJsh2BWwskWD
	ItTJbbxk/UihX7e0jWyzVGmwqWvYLcdIOaMGf9hT1IDs443aqTL1YzefLXJ2FxpIQYEh+gxKde7
	N34UwAtA=
X-Gm-Gg: ASbGncuwM+MFOEPn0l5ljrj9xXKLZyhBjoWJBTSmCNZ8u5dCGyNSG5cSDebXnzRmccK
	cx+lX3JflP8PiOsU1I3fLraVhW7L63s3mAsGEn+R6hJxIPcYBxihUYDHelqQr1cJM7ANquNIvfW
	gouWBoIZL3g9S5x6GzlcXsbdlRNWL9pxSeWrgUWdbIgjJheF5jp/A5gP2Q2blPVAC8rrLA/ZHuj
	DifYRszFd9gblE6LizY/MGl+/rM0z3teBJMzuZgBZMcoY03QeAr7G9+WOiuZfSLYY7WIvY2IUYU
	nk2yJnKZlZIRpXFKxCRAzreHxjPzgzmxlSzxQuRziKxbueNrXx648qoBxgNjMD2g/9zVInc9Kdv
	fMmi9k66n/Jke+p3La09/hd9wh3M2Yb+5DSJmAcJiDdU/f2wsPLQKaumQC7wiDCNUg/6XOKYj
X-Google-Smtp-Source: AGHT+IGEPrH+RsRocR7qItBnt0nZgAnbOOudjal0Ady2aT73tTvAa9u3ZDl67K8Pegv4wcCyqv1Mlw==
X-Received: by 2002:a17:906:c107:b0:af2:42e8:ad9f with SMTP id a640c23a62f3a-afe29548ffdmr1883747966b.39.1756313882369;
        Wed, 27 Aug 2025 09:58:02 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe88c76f61sm620537566b.10.2025.08.27.09.58.01
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:58:01 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61cb9e039d9so24711a12.1
        for <ksummit@lists.linux.dev>; Wed, 27 Aug 2025 09:58:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1hxKSbAWRsngiBUwlUkHbtXeydSkb/2m6xta3htS1e5F1ZGRYmnBwr2CS7k8MsaF4BbseHwkp@lists.linux.dev
X-Received: by 2002:a05:6402:50c7:b0:61c:8728:360 with SMTP id
 4fb4d7f45d1cf-61c87280991mr6831503a12.21.1756313880594; Wed, 27 Aug 2025
 09:58:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSes7ZnGo+Wyk_Db8VEUb8iXFB6-ev3hceY9aY1vjhpywTQ@mail.gmail.com>
 <CAHk-=wgOXd-meRuz5Gv2oz0W0wBUOpMO5CK9eifjfdR5Xz_-Fw@mail.gmail.com>
 <536or9s2-r219-2854-2n7s-q299s7q7noq9@xreary.bet> <CAHk-=wi2E0BBX1ZUEo5B5a0E+M_eFU_NgWgp+cABfsqR9f-cAQ@mail.gmail.com>
 <CACMJSesxLDH+ZPcbFq+s-4E+3QmhU4JejYZ6-SoYBfM0ePCCtQ@mail.gmail.com> <CAL_JsqKqO2Qg6VnRaotQdfrfoo78Y8AA1AKQBrD_XVSEK2BMgA@mail.gmail.com>
In-Reply-To: <CAL_JsqKqO2Qg6VnRaotQdfrfoo78Y8AA1AKQBrD_XVSEK2BMgA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 27 Aug 2025 09:57:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=whkAe8f4=ttQmZhtoKvGtCLhEA-oHwUEvQFftYAwfVwCA@mail.gmail.com>
X-Gm-Features: Ac12FXwNnkGMkp1uMwcBA-qxJCXCwRd7eiMIsWsFoc8tqhopPJlftt6wjzrgBdE
Message-ID: <CAHk-=whkAe8f4=ttQmZhtoKvGtCLhEA-oHwUEvQFftYAwfVwCA@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Enforcing API deprecation
To: Rob Herring <robherring2@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Jiri Kosina <jikos@kernel.org>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 09:42, Rob Herring <robherring2@gmail.com> wrote:
>
> I have a similar situation with DT APIs. It's a bit more nuanced than
> the GPIO case. There's old APIs which are "don't add new users" or
> "think twice before you add a new user". We may never get rid of the
> APIs because a) no one wants to fix PPC and Sparc and b) there's
> sometimes a need for these lower level functions. It's similar to
> using devm_ APIs vs. the non devm_ variants.

Having parallel APIs for different use cases is perfectly fine.
Normal, even, and not something that we should worry about or even
strive to avoid.

The devm_xyz() vs just plain xyz() is a good example of that. They are
parallel for good reasons, and they will remain forever.

All I'm saying is that people who do new API's should either just
accept that, or just convert between the two. None of this "deprecate"
garbage. None of this "blame other developers because they use the old
interface".

That's the basic tenet here: if you are too lazy to convert all users,
you also do not have the moral right to complain about - or expect -
others not doing the work you didn't do for you.

               Linus

