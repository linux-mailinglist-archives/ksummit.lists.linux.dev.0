Return-Path: <ksummit+bounces-957-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB9B7771F2
	for <lists@lfdr.de>; Thu, 10 Aug 2023 09:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ED06281F58
	for <lists@lfdr.de>; Thu, 10 Aug 2023 07:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37F26AB4;
	Thu, 10 Aug 2023 07:55:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFE046AB
	for <ksummit@lists.linux.dev>; Thu, 10 Aug 2023 07:55:55 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d4b74a4a6daso577993276.2
        for <ksummit@lists.linux.dev>; Thu, 10 Aug 2023 00:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691654154; x=1692258954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzJ27RCXBhYelgMBbp5diddpk/rURIzLrWtM3cDGdaQ=;
        b=muybhES9Q/Fs3n29wutCya0cZdf/qotUqliBZT8mGlzfSWK3Pw0M84XZlAjtZq9+SC
         RJ42Hb9JkCYrCBL8OTrOnnUbUnYB7Ww0Z0aXqChQ7ji/9ihUS0TjHi3uSWIOqLlaAyDy
         ChC7ao7YP5dPNlSdp/w07IHJeB908sR5lPCOgn+uGiG4N0V6lw4phKC21gNVbMBItMGh
         RUjsBrxF1g66JrkuaQP+B91Ee8ccxgL8ioQLNXqCWTzIHOsML8HqXWVifyJx4G/Vsmv2
         iihrHtzxJat1usxx9lTXl5J3kJHzVJFZqcX4ALJw3x8qdCMahGVd5gNs8Ph3T84l9Sfv
         RU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691654154; x=1692258954;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzJ27RCXBhYelgMBbp5diddpk/rURIzLrWtM3cDGdaQ=;
        b=LaDUWOkKNpIOTqed2O1FcWiVdpaYZdapVsaBBWF5YbjSA86RgNAZQ7pYtzodYaxHeW
         L7vxSXXNIGLQ7TkvEy5AobkR2AbyR72nYQZmmw7SnvVndhXejI1Er3x5Pc6dWF+0R2t4
         iPORGXxVX5gq3OV0WYpOYQhoq0d6LEr7LmFzQmVtq2x7YAJZyPKChDABJUcc1zmiciDY
         H/ilFwsjaz+hTcnov9gHbo28ViCngGl2Noglk985QgRuzvwPKKy90UZxshomrb6QtScZ
         CqFsIARp8hr6FzpnCAOJUQGEbDzU5LZ0yaMOUBc1XsZ7/LgQLPgZZh0iBH/1LgoNkyaU
         LjRw==
X-Gm-Message-State: AOJu0Yy3K7vYaH4IpwaGMO/jRGAz+tYVugYDjIG0Jl1BdYajUzF6ssqb
	PghyC6o+elIQS6O+qGZoRoriezbDan5utkzZDrmhv/fYWakBJY6t
X-Google-Smtp-Source: AGHT+IExLBfxUw+kNn89DFP3Dhd70VlaTnPFdiUgMAFZMQNXuLrikcO7MWg9Klq0rSv5viWTThTwFfsqkdxuwgR3ml0=
X-Received: by 2002:a25:cad7:0:b0:c86:a5b6:cdff with SMTP id
 a206-20020a25cad7000000b00c86a5b6cdffmr2006777ybg.19.1691654154024; Thu, 10
 Aug 2023 00:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
 <CACRpkdYtoD=OyoK_hyyORmUkcKcCM3m+GO1XUHdbmaS8gW0=BA@mail.gmail.com>
In-Reply-To: <CACRpkdYtoD=OyoK_hyyORmUkcKcCM3m+GO1XUHdbmaS8gW0=BA@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 10 Aug 2023 09:55:43 +0200
Message-ID: <CACMJSevjabk+HeT-797bs9kwpRA5G+SiBzbcRsavpVHXt5_JsQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Aug 2023 at 00:03, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Wed, Aug 9, 2023 at 8:05=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@linaro.org> wrote:
>
> > Recently there have been several talks about issues with object
> > ownership in device drivers, use-after-free bugs and problems with
> > handling hot unplug events in certain subsystems.
>
> 1. Good topic.
>
> 2. Is this also where we discuss the use of <linux/cleanup.h>
>     commit 54da6a0924311c7cf5015533991e44fb8eb12773
>     ? Because I would certainly like to learn more about that
>     thing with an example or two.
>

Not really, the problem with subsystems is more about referencing
resources that can go from under you without you knowing, but there is
an interesting coding pattern in C with autopointers and reference
counting that I definitely will talk about.

Bartosz

> Yours,
> Linus Walleij

