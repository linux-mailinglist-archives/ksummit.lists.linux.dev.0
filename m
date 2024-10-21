Return-Path: <ksummit+bounces-1591-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6309A9393
	for <lists@lfdr.de>; Tue, 22 Oct 2024 00:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3650BB21FD4
	for <lists@lfdr.de>; Mon, 21 Oct 2024 22:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657E21FEFC0;
	Mon, 21 Oct 2024 22:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Qh108Q7L"
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF051E04AB
	for <ksummit@lists.linux.dev>; Mon, 21 Oct 2024 22:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551394; cv=none; b=MBroex2fQYLRA4uJi6Jt65IAZlIrcs5zdnq3Ieh4O22/CKqkjFe9KGifnwP9wN1vpN98NVYX6RlIbLEi7VNhG9ZslvNwhHrJ+hRzXqxri80PDl+pX7qaD+cWmQvX2BNCbeNasisgvi93U1xPWsI5q0d1JoNiMZc9DVHT0gILzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551394; c=relaxed/simple;
	bh=r8egg/Vf14/dqyN4kV4AetN5NUQl2M/4KMeQDZE3hfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRHCmRtVX0Eg8Opw1NOD0CUxcNyCSU/AryMd79RiZxdg1fJoCwKEBICgDp+7J47jbHjcXqVwE+oobCgb5Z+utU1FMmDRP8QgpbjNWZYMuXUZ43m/fGN4t0xgsnthyHhe9GnM6fmut7PLrZC71gTe8JGNyUawlOv3gYKpaISi6/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Qh108Q7L; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a0cee600aso630983266b.1
        for <ksummit@lists.linux.dev>; Mon, 21 Oct 2024 15:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729551391; x=1730156191; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lGZ24lUdsgbUdWUq48cY+ttuhX+8F11TIe0DlZ2JCjI=;
        b=Qh108Q7Lb4b9QbOrDbrLc6JCf7r/yyzGoE22LSCJSUVjOdLRiJCQP5HBBNjvqTUxaq
         EIEu59VZwyk7bJ46d0VHHkZrwEH07anwbwwHJhLFdqMjYixKlyXwVSegrb9BK5+jpMxG
         o5T7kKC5DctAgBp4ANOmxbJc+DzC4OIAjBjt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729551391; x=1730156191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGZ24lUdsgbUdWUq48cY+ttuhX+8F11TIe0DlZ2JCjI=;
        b=AmyCwB9AbBCLF8DHI9BPRXIRs2T39GF9yUa49Q5PteVnEe/H3Ouo2MwncQciHwZXZc
         iu1P7HUQMGifyMKOSAaRkjmsBXnc6vrUA1EbzjcKnemATLoYd9XBPpwRDNsOal7Otik6
         t2Gw7ayejXHJIX44Sww2a6f/5+KIONZyku+CrFS09K8HMWSqLRi728mYotqKzHGjI1fy
         rbPY/cVwXKFO+AYelXC+/+58vgW0Jal/b1N5JOk0Uw2F6mVe9hdvMcOXmhNgmVNDczrP
         3Cm3hdxnnAE8cL9i0r6OO+a5y2zAYHVf8pC8koxpb9BaIKeIH23KMYqpGeGQhKqs3PEe
         eHrA==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZV9wQ0q7n9t5DIz+gwtxC7PbPwoZhVqnyRnnF1sIMuBQHoOCJkf3veJ9LZpK2/D3ecEwLq9B@lists.linux.dev
X-Gm-Message-State: AOJu0YxNQQRUchf2aWHSRJKdyYzuMPEuxKnJe0EyzZz6zqwtbBGESdb1
	1WuzVKiPgqmJhvPGYWxdYB4NlGyyx6nyQPwXpChJExIaIsPad6+t4D6yTo9xLGRL24JNinYplNc
	h/Rpsng==
X-Google-Smtp-Source: AGHT+IFHElNV+G/paRyAXXLl0RPQPGsbpmdSnwP2eFIbXV0F7yEz99i4PG+MGocq/AlW2VYsK3ot0A==
X-Received: by 2002:a17:907:6d24:b0:a9a:13dd:272b with SMTP id a640c23a62f3a-a9aace24e10mr51926666b.2.1729551390766;
        Mon, 21 Oct 2024 15:56:30 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912ee592sm260750666b.79.2024.10.21.15.56.30
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 15:56:30 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9932aa108cso737063166b.2
        for <ksummit@lists.linux.dev>; Mon, 21 Oct 2024 15:56:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWOLS9DHr/omvYlMtMKlWdppTq4tUzgIx96rTk5T3mEmrRFFV9bhCm6hyqtVmBjtfDxQFFvEs/m@lists.linux.dev
X-Received: by 2002:a17:907:31c2:b0:a9a:66a9:2c55 with SMTP id
 a640c23a62f3a-a9aace25cb3mr45947166b.6.1729551389933; Mon, 21 Oct 2024
 15:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <xhjzj6kfgg2dxq6swurwaeyzqtd2sl4dat5pzg6jolirw5og6z@bmwdcuwsf2bv>
 <ZxavDApnkMl2xZNA@sashalap>
In-Reply-To: <ZxavDApnkMl2xZNA@sashalap>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Oct 2024 15:56:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjDo9gr8gD+XcWBjvNCSZg=GbmfqtM13o0tAtWrGY8zQA@mail.gmail.com>
Message-ID: <CAHk-=wjDo9gr8gD+XcWBjvNCSZg=GbmfqtM13o0tAtWrGY8zQA@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: Sasha Levin <sashal@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 12:44, Sasha Levin <sashal@kernel.org> wrote:
>
> On Mon, Oct 21, 2024 at 02:36:39PM -0400, Liam R. Howlett wrote:
> >
> >Would it be difficult to catch branches that change things outside their
> >scope without correct SOB/RB/Acks?  Asking for a friend...
>
> Up to the guy in charge... I don't want to attempt and monitor a policy
> that won't be enforced :)
>
> If Linus wants to add this to the workflow (which is doable), then an
> explicit ack would be great.

Has this been a huge deal?  There are things like ABI changes
(function renames, dropping or adding arguments etc etc) that will
inevitably end up tree-wide, and honestly, it would often be totally
frustrating trying to get acks from every maintainer.

Is it hugely common? No. But still, I'm not convinced there is a sane
model for "outside their scope".

I mean, sure, if the change comes from an individual driver or
filesystem or something like that, then it generally has no business
touching anything else. So it *can* be an issue, but I don't see how
to sanely automate this kind of thing without it becoming a potential
huge annoyance.

Maybe other people don't mind, but I personally hate false positives
that you are then supposed to ignore when appropriate. It just makes
people ignore the things they *should* care about.

                 Linus

