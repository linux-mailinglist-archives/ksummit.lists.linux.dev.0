Return-Path: <ksummit+bounces-1184-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19187A9451
	for <lists@lfdr.de>; Thu, 21 Sep 2023 14:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 053171C209E8
	for <lists@lfdr.de>; Thu, 21 Sep 2023 12:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F988B64F;
	Thu, 21 Sep 2023 12:40:22 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD048832
	for <ksummit@lists.linux.dev>; Thu, 21 Sep 2023 12:40:19 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-59bd2e19c95so11763307b3.0
        for <ksummit@lists.linux.dev>; Thu, 21 Sep 2023 05:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695300019; x=1695904819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il82sn9VjXd035vNnMGJ8n3meCT0uW4LFiG4+phvGcA=;
        b=yHeE8jGIOqBZJdUPu0Vl0ixxOWAxoEVWmLk+En16yexhgRMO2PTwc2QktsTcmHkJIU
         TTGnb6B1oQG4nm0g1qWM5wgZhjs+/Lzf3qWeVvhGH5FJYFQCxIOEIUbTyTRutjI5FO41
         6GCp+H8B6yWsFhkX/xK9OkkoIZM1++oQR8uCDx7A6MtYX4Xxy07Kfq2HPUuJB8L7KB+2
         4vwgwko9MeD7RRkCyu1jdlqITCI9cds94kCRFsqn1uDvyE3ANXwvFie0CcQPUfwlDglc
         WWvhbRPIfgCS7ZA1fHgNhh112ssroCpeGtl+uBZWjOtJmJr2zPxA3oVxtAV/fmkdvX1t
         4BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300019; x=1695904819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il82sn9VjXd035vNnMGJ8n3meCT0uW4LFiG4+phvGcA=;
        b=Vi4lbLtoyFxbCQHSw9iVc66oq71lxHe5BsCKqEyFL9WLqMhoxxoLdLxqd8EDpxkanX
         EZWaYKWpy8pMzzKl5CTa7eYh2w8m793eP/52t+Rhzvs1bt7OzCxMKTzCVqOvmQ/dEOty
         e4eieGImi6uDyl6VUp5iLqFojHNMpXrapHUtbnMOBd8D5J2bwqQHTtjpVVBXR0jXfrXP
         zYm7C1ZF2L1OxU+GtW7DP/S59KOkF3cZwMIEzBjCeaKVg/+wXif6Kkndo4xx+Hg93GM9
         W8rQTsMMhbaoIKkQ1VJn2cEBGtx6GAXeqDj7om4DgxeG8/M8VvCyc0qZmcqCrxOTDTiG
         Mn3A==
X-Gm-Message-State: AOJu0YxArQtZvJfp0t1Z76bD2vZqbHGGtAQd7EwMCHRdwXEpfEYytEXJ
	FALsDTj1ifFwzLA+pwF1+r/a6vcEXMWelDmRCtQd7A==
X-Google-Smtp-Source: AGHT+IH0TPCiDtKGwp3RGsIZRb0Uh/7H1vtgD/BWMddtwI1KPGkJCVuiTV8srOVZ5x9PdjsHag3bJ8ivaJ6YXmfzi9M=
X-Received: by 2002:a05:6902:1364:b0:d85:ad8c:4bfc with SMTP id
 bt4-20020a056902136400b00d85ad8c4bfcmr4217099ybb.21.1695300018792; Thu, 21
 Sep 2023 05:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230919121001.7bc610d4@gandalf.local.home> <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
 <20230919132112.19b700df@gandalf.local.home> <496f0b46-1a40-af25-ac1a-d4e7f1a8aad0@kernel.org>
 <20230919192148.1010cc74@gandalf.local.home> <57b53325-3c40-641e-30de-5755650960f8@kernel.org>
 <20230920225441.GA12561@pendragon.ideasonboard.com>
In-Reply-To: <20230920225441.GA12561@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Sep 2023 14:40:07 +0200
Message-ID: <CACRpkdY1bg13hbM6k_Em1A_wMZSaHOnrvv7J=FRK3e9z4HbN-g@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Shuah <shuah@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Bart Van Assche <bvanassche@acm.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	tech-board-discuss@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2023 at 12:54=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> I wonder if I'm stating the obvious, but trying to figure out ways to
> handle psychological problems in a group made of software developers
> seems like we will be fairly short on essential skills for this kind of
> exercise. Given the size of the affected community, I think we could
> find ways to get professional help.

Yes, can Linux Foundation help?

(Actually I have a bachelor degree in the behavioral sciences
but I guess it's not common.)

Yours,
Linus Walleij

