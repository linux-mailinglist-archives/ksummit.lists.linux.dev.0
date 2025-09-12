Return-Path: <ksummit+bounces-2377-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A9B54D89
	for <lists@lfdr.de>; Fri, 12 Sep 2025 14:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7F81C2230D
	for <lists@lfdr.de>; Fri, 12 Sep 2025 12:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C73304BAB;
	Fri, 12 Sep 2025 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lTRAsNQQ"
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AE82561A2
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757679535; cv=none; b=ExrrY/PHF/mtbmmU4iSBM/vGRZV6BbkqfUGxHIAR1FVWOdI9sx1HS8eCCcN4CLzZ1cAs6sWwAOahYXalOZAh2zFTfKDp5oJ1MHZSQ2P4xR89PMCzaC8clMFF7U7X98RNkwirdmkoE71gv09a30yD+ZA+oSkUqRTa/A3/YWf8KpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757679535; c=relaxed/simple;
	bh=M2Rif52EUGqqa5X1hjkbu35XvRMJOuWaDlJIruNdwSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4s61+jmrTa2NU9fYqqschp26lJb7E0rERO1lKg0CV6BDSDzm4vS0Fxzo0DzA3s0WzW4kX/mXG/u2+M1EAFnzZsKL2AhJjotBPM/AdPdpoSMWn06zy82xU74DtIrPixgH+N4Zt6ak6xQcZ7EBp1VQSWk4HoGoP3wlBuhuM3u9BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lTRAsNQQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f720ffe34so2276418e87.1
        for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757679532; x=1758284332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2Rif52EUGqqa5X1hjkbu35XvRMJOuWaDlJIruNdwSs=;
        b=lTRAsNQQyqknBlLOPtRFbK7bODUoi9/9bSt3j9lkTMEWwHibttEUnEi7TZk0rgjAiw
         uScPmeks8Yn5cqDht1RrVb+jOQ1PLavVvUHceAhAObGjxEjcRBMRPRtM7OpFzJYGrdzy
         9c3nYYxeMTjfWC0dphwTkwDG6xRlGwuY538kvDf+4kAWQtz4BIUI/AGnCSJCvI0p7VrP
         o4dKtr7I74IV9Hh1Qlu0REGMY53iizePcMNDOWlWTOfQfT25L6jkn7O/lij6HiiKbgef
         js8NO7Jn1vDKifl3ixUX3KnUgzueigzwbLa1gjdafwqUOwz8mrhsZlsvUAybZ9OvGQDp
         MOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757679532; x=1758284332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2Rif52EUGqqa5X1hjkbu35XvRMJOuWaDlJIruNdwSs=;
        b=LkZm34QVpNtdtMNPQqODThRyOqi8gci5wBegCjSYM0DLdro2mtKZ7KChMDiXn2qkcf
         2sonbFN8ry8RRR7qZfChApc3V+zdS5MmqinKntJEozlhydA93ocTFI+v6DaXtsrwOAZy
         LZIBrK/xecS065uOykx8d5LO6qOtKB0lqUvLVC2eVcYyZ+N4lE8VktEwvqZ4GwD/mUrW
         2Vm8dHfuIOjsfeVU5KypP5iabZ6eHtP1KlTrhS3BiLioXu13WLEdwWequho9VT8rGtO/
         szAGf7fqXQt7ZUp0S9XPzvdWsYPXpsa63iBGnRDKSEmUOuxDaJjbDzHaBRKpKsthrf7k
         FQXA==
X-Forwarded-Encrypted: i=1; AJvYcCVChu9PNjMY8DGQOXR4WvALg1doAGh1y4UQc8KPxszUCCau2/DOWLX3rULGAjILH+bx5bdaHUPr@lists.linux.dev
X-Gm-Message-State: AOJu0YxUIEXQAYMkL6Kn/z2wP/Xz4vRYRg7som978qELj3HXsP5edH9q
	fDqm8PiS/DGV+HidO1Aptl7/YX2rL1dZgFTr7zSrZHTAfbVBS/ZWo2+30Y1MGqV88pbdCbKVFBc
	+WFUr0WpCAEr9auKS+N+SqVuoYEJGjjIjvdAhFlLL1Q==
X-Gm-Gg: ASbGncsiDg4hAIV2hExVGYV+vCEUbDQk+qDSxIOkMHxmifOY6GxP3Iva5O+laWFjOky
	T2Z070Ho4ynuz/qpENXCZyYbGGq7Dj9WaIu6bgI5cFWhYvSBlky06SMqfSf/CIkQw9QTYsnI+35
	z8seAql3KhCXh3OorBiQoX5Ow2wd0xUjAO1nhh5+pMQcRoX83nMBueQwIKCO0DOJHn8HGYQfBIt
	PJLn1Q=
X-Google-Smtp-Source: AGHT+IE86+YixUBvdVqhjl8z8A2WxlHe+I9DgW+HF6E6pSWbcoWySDH9jTxaz+MFXyRKIuXJl5lIdyiwLRxNgAgq944=
X-Received: by 2002:a05:6512:3053:b0:55f:6c89:255a with SMTP id
 2adb3069b0e04-56d7c3ab118mr2145692e87.28.1757679531812; Fri, 12 Sep 2025
 05:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2025091207-blouse-scratch-dde3@gregkh> <0f876c7c-566b-476a-b590-d490d41d605c@intel.com>
 <CAPpb9ymTGwMnJaALJOHx4TcMLxA22w_KcY8=Zxzy_Qy7Uk==9g@mail.gmail.com>
In-Reply-To: <CAPpb9ymTGwMnJaALJOHx4TcMLxA22w_KcY8=Zxzy_Qy7Uk==9g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:18:40 +0200
X-Gm-Features: Ac12FXxxeeF04Jlt1uYN14atvQR2NcJw4bxA6Gv5hrFo1vA5qJt0a47l7ZaPw2k
Message-ID: <CACRpkdZZdj1o++Z2tYVuHBkY_Tjypo=gu9srw=f9iL4rDJ4Jbw@mail.gmail.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
To: Konstantin Sinyuk <sinyuk@gmail.com>
Cc: gregkh@linuxfoundation.org, ksummit@lists.linux.dev, 
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>, Leon Romanovsky <leon@kernel.org>, ogabbay@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 2:07=E2=80=AFPM Konstantin Sinyuk <sinyuk@gmail.com=
> wrote:

> Longer term, as UAL adoption grows and multiple vendors hook into the
> framework, the natural home would be a dedicated drivers/ual/, just as
> CXL evolved into its own subsystem.

If you already know there will be other things than accelerators there,
so it's more like, i don't know, PCI or greybus, then put it into its own
subsystem in drivers/ualink from day one, I think drivers/ual is a bit
terse, the world is full och TLA:s already, also that is its actual name
isn't it? Hard to miss if someone is looking for it.

Your merges can still go through some submaintainer like Greg, or
DRM, if they need some shepherding to start out. After all that's how
drivers/accel is managed, through DRM.

Just my =E2=82=AC0.01.

Yours,
Linus Walleij

