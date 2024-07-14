Return-Path: <ksummit+bounces-1402-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFD9930B58
	for <lists@lfdr.de>; Sun, 14 Jul 2024 21:28:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D98A1F21940
	for <lists@lfdr.de>; Sun, 14 Jul 2024 19:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0C613C3D3;
	Sun, 14 Jul 2024 19:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L4nuzmuw"
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F78D1FDD
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 19:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720985298; cv=none; b=JZTXqvhDAh0jaxzZh1E9BL3POGPwn41etLxG+nPuyLTN9Rkqm9IhdAwwPC1H6fo4j1OG5LE4Gwt5UMQb+7rwBcwg5sleD+MU9QbgtmhsAI8YOyrkyU7N7KPDrJ23XMsclANpGH0iAuAvaZgwGApD4k+IQambjDZiVRiEINcqJEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720985298; c=relaxed/simple;
	bh=9GBaebZGhlEUy38lOtGkiTwHdzsjl8cBZuEio/gSl8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hI2i8ElXs3fJnbMrSUj6lq16GULRk1zxAym1i/WDWIMixce7btzaicVS14ZyEF2piptMZjDH5+1cMU01fxruBG364rvEQpC41cPpgOLzWeiwzhUeqXWmWtmzVJqQOuB8OUwSPvMR4OX3MHBe6ZnXsd/06aTamzFCpWT0om8Yaic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L4nuzmuw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso6298004e87.0
        for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720985294; x=1721590094; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t8IKSXxTQD2VekxHy64FCb3K8ae8GzDSC7uYISoCzm0=;
        b=L4nuzmuwOed6Rj0XWXJDEKy5v0nd7j0iL7V+P0gYDfCy9TxdDT68PBIVSDucPafYdj
         icGR2GuoMunTzDGfXY/9kFqqIgXFZFWb/9tqO/cPX4V7ee6tg0sUj3c9uBpg6s0fJq1V
         IOodX8FlpM7fK6Kusb8FVAxea1v4X2bUEePu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720985294; x=1721590094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t8IKSXxTQD2VekxHy64FCb3K8ae8GzDSC7uYISoCzm0=;
        b=OvQGewyTYYqMW/lTWRR0itMjRvkfNDKRw1CA4DA22soyfBR5xRbIwANHn0ZrBPN4NK
         plIGYbBzuMv5IQ6AR/ASSCgVxk1ue6eCmS+xKGE1wLQQl+mpU0XMnXPf5qxJTZR/uWZV
         LBF102BELje82MJHhFCamMwWchaZ6h7bqcWDV+JoC+srjBVpHMvHPuJWkhWh8yO7Y+Gg
         eiwXkWtocaPrU7ErXWfYGlywlYI1TSkjESZ8gftkhNhK0Dqm02jRH/A+JNC0ISYLWCT/
         l3OXt6R8VjHPfVel/oEGl8Cxaa2tvn3oPrMmMjkK7Vt8ijRwFkChJeio0GYuD2cDhns7
         xbeA==
X-Gm-Message-State: AOJu0Yxqxhlg9JO1YNaMQYT+kst+geukqUSnKSqqUyT8yUYWUPwixd23
	r6HHovv5j58yCiTweA2iCTGtE7kgi4Ip+L7pEuAN+dDVYaCsPJ8i712akE6VpZ504npINi487bR
	Z2irNgA==
X-Google-Smtp-Source: AGHT+IFNWgk3RD5GbORwcX7+2Sji3pX+KOMz+jjk2wna+xLoX88QaH6eej13PEFklqvIO5tdQc2Z9w==
X-Received: by 2002:ac2:4901:0:b0:52c:db76:1c2d with SMTP id 2adb3069b0e04-52eb99d5f15mr9930731e87.63.1720985292456;
        Sun, 14 Jul 2024 12:28:12 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24f36f0sm575924e87.82.2024.07.14.12.28.11
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 12:28:11 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ea2ce7abaso6297975e87.0
        for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 12:28:11 -0700 (PDT)
X-Received: by 2002:a05:6512:308a:b0:52c:ec68:6165 with SMTP id
 2adb3069b0e04-52eb99a0fdemr14090205e87.33.1720985291451; Sun, 14 Jul 2024
 12:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZpPFJH2uDLzIhBoB@sashalap> <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
 <ZpQdJpKhIzmf3veU@sashalap>
In-Reply-To: <ZpQdJpKhIzmf3veU@sashalap>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 14 Jul 2024 12:27:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
Message-ID: <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 14 Jul 2024 at 11:47, Sasha Levin <sashal@kernel.org> wrote:
>
> I'm not trying to add an additional tag,

What? You *literally* suggested exactly that - adding an "Improves:" tag.

I'm not going to use such an odd and pointless tag.

I would hope that *all* commits improve on something. And if it's an
actual fix to a previous commit, it should say so.

If it's just a random improvement, it shouldn't refer to a previous
commit at all.

What you seem to want is some made-up distinction between "fix that
wants backporting" and "fix that is not important for backporting".

We have long been told that commits that have a "Fixes" tag don't need
a "Cc: stable" because the stabl;e people already pick up on the
fixes, so now you're complaining about the lack of stable tagging.

I think that the *real* issue is "not everything is black and white".

But no amount of tagging will change reality. Reality is not black and
white. Tough.

              Linus

