Return-Path: <ksummit+bounces-1704-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6AA3C2A4
	for <lists@lfdr.de>; Wed, 19 Feb 2025 15:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ABD23B3EB5
	for <lists@lfdr.de>; Wed, 19 Feb 2025 14:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB431F17E8;
	Wed, 19 Feb 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ff1PplvC"
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74F1EFFBF
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739976686; cv=none; b=alnNz2cKI+rtuxf0inTU40jZMvfet+UKJxffq7tTSWC0yWu9H5uiH/jN1pK+MSx0zLv03L+Eeh5rvwwUy/A7BmfBlQWOz/utBCo1GRhBc1tp5gDBRhscuzi/PAd5juxvlAFfMfIE9hTX5SDNUt3RqfdU/JbC4fvRIjfIQ1PFIak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739976686; c=relaxed/simple;
	bh=oS+yu/QgRYhKSZl4yDfF0LhoNp/PyaQ+d1uaBefYcqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEHjTaOKw8K+OdfK8/udeOh/aOYap6yiJc3XX99jqJLfbwpD53ZZXZRtDtYyETb9m1VSRTsqBstZhigmenflSeak6B5NnsH0EeqV2/7ZLm3wpUyTp8uEa8mUlarVCPMweIlCr4Ldu11+8Ip1sif1v17uQ5eziEkTvpIiy8vjBTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ff1PplvC; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f666c94285so58878007b3.3
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739976683; x=1740581483; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYcZPixSU09FvTt2cU2XznLhSpH8HftilN3r6wgw4wk=;
        b=Ff1PplvCRvsvZNyr7OAe3enrdzticmNTLwVWW/fvLGBpqyrAFaN3qgGwtGBpkdK08k
         aqZDHphqWCtUFiAEtd7Hjft93q3t7ddOkm1ayx4FySjkqInjZdVrZYAbW+IjXPmUr2E+
         893MogwBeYNH2IcVr44qX9sU684kY5B94bN4sHpenigQLuYkWDAEyJAnVNysmWBYs0H5
         O53Bm4xYi7CchUp700G9VhlZQZpsWfTcaTUQw6oopfYpYTRJoXyS2Gc4T0J5TZZkGaTK
         Lc0Wgx90v2r53LTP1foKLX0QQuDXlsSDfox6HW5da0Ro08G1rKXixp1n8QoPI3Si5p0+
         uKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739976683; x=1740581483;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYcZPixSU09FvTt2cU2XznLhSpH8HftilN3r6wgw4wk=;
        b=PQYzprS4Au9i7ZrkW/i9DueOvWhHBmA0WOrasLZ4pAuHI5HiHkxl/isLlsBN0lE0RR
         tSo07YnaVTwPIVgGM2qvDLthdZ06F4QabLiINvVDn9FoGlw9zeiZ3cI/BqKFUOrYQFbG
         UGlowla+zlI2Ea1E6sdgBxafNmuW0VgvrGxsLtZQpzS/aLwBDcac7ogMo/CRsXsI1sXB
         G48H14a4HSJ925EHWoPt4Bfeh+iZPR18xNo7AvBdRGKhJMoIsw6dlSxbbhdZhmzAQyI+
         FWJhbLjFGhxbrPJJX0VVoAE//sScM2jBzQxq0zJjFx19cm4z1siB/Pqn2Ep1KnnDvY72
         x4vw==
X-Forwarded-Encrypted: i=1; AJvYcCV1GU4nwLxyDMHokqJ0wsvquboFfdVy2Bb+AMkxZD4ZqCpqfi+94ZN0BObl0upAKSszbXxhV9+a@lists.linux.dev
X-Gm-Message-State: AOJu0Yws+G5dH3gTIYowtqspC2gV8xdrWoP+IpcZ/vYdnOf5XLxFLDcW
	IS/QU5QfEe7I/hZTk7BHyKHdSjux/e/eVWgKe5QXrFeOdrU1MCXqRz2TicPwFzBLAyDFAJ6rnI1
	cote/k/6aZaiNYfFuHBor86GL8SdkDD+WUthlwQ==
X-Gm-Gg: ASbGnctB1EQDPc5f2pVD74jioziSJyqBgTZVfrkl7OSgqFT8P06eduaDGuqIH/PbcrD
	qHDwWYfN4Ov8D8oKFMLRj6I2WUT3VB6MSUhjS3fXVSGmAR9KsXNCo/47DaV2yqeNjWfuZDoJhsS
	Pdhkc+tuU2xHQeFYXfuZ5sdsRHyAA=
X-Google-Smtp-Source: AGHT+IFDRnRjjoBS/EtzzR/rm4w30wJi1RY0H6xdR4FvTj6621K9TBsfPk05+xPr/Ay6d44n/69mJWQak4reieBYPok=
X-Received: by 2002:a05:6902:dc7:b0:e5d:cdc6:7ad2 with SMTP id
 3f1490d57ef6-e5dcdc68210mr9659126276.46.1739976683113; Wed, 19 Feb 2025
 06:51:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
 <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com> <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 19 Feb 2025 15:51:12 +0100
X-Gm-Features: AWEUYZmLPvlXBp47lLPgCcdKQupT0djJypa3PTSZUXuiz24ub3UWxBzENa0nPX8
Message-ID: <CACMJSevfxqdwOTAhV9CLautgoEur9G+9HWmQY18h38vNE4Vv3w@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Christoph Hellwig <hch@infradead.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 15:47, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> James,
>
> > Could we possibly fix a lot of this by adopting the _cleanup_
> > annotations[1]? I've been working in systemd code recently and they
> > seem to make great use of this for error leg simplification.
>
> We already have this:
>
>   include/linux/cleanup.h
>
> I like using cleanup attributes for some error handling. However, I'm
> finding that in many cases I want to do a bit more than a simple
> kfree(). And at that point things get syntactically messy in the
> variable declarations and harder to read than just doing a classic goto
> style unwind.
>

The same header also introduced infrastructure for creating "classes"
which are useful if your "destructor" (or "constructor" and structure
definition for that matter) is more complex.

I find the lock guards from the same include very helpful in
simplifying error paths in critical sections.

Bartosz

