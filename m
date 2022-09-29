Return-Path: <ksummit+bounces-785-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7845EF65B
	for <lists@lfdr.de>; Thu, 29 Sep 2022 15:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 312E01C209F8
	for <lists@lfdr.de>; Thu, 29 Sep 2022 13:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE801C33;
	Thu, 29 Sep 2022 13:23:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E49A1C15
	for <ksummit@lists.linux.dev>; Thu, 29 Sep 2022 13:23:17 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id u28so796881qku.2
        for <ksummit@lists.linux.dev>; Thu, 29 Sep 2022 06:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=/LqaYMWd+e8179nhCnWMpRCYJw9EIbTWpFsZd76jedQ=;
        b=hq5kvNzqKKzq7AL+WK6BeB0Tb3Vwv3HuT571a3AFTgOcR13KCW4jZvSstDnxBGV48G
         2imJ1e/DoIxjTv1IE34mGAbLlr0hopJe60BrS/YY6ANrnaIbdDV/Rgm2dC646OtWNzi7
         xVgDO18r62OVs0xzGNv0loZEN2J7QE6qFnvXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/LqaYMWd+e8179nhCnWMpRCYJw9EIbTWpFsZd76jedQ=;
        b=WafmNHRxdIQf0CMHRKnI/Jzrq1vNLau9rA8gUFajwRBT7AqZ7puG/Nhe/PsMIYJpzP
         bk+vwvcc1wEmraIACozhGzQzGlBQ8Op68bGYXpsvCM8t3yoVYAhjBEzULSqBneV67BcR
         tX9/qW/k0gm/lB82WVLK8+g5N7+hE5TFyCunKUooYCeWq8j9twTZhBTh9sfvdUrxv1bx
         u+HQfWtPzYKGHK6sg28qLD1v+pW7SDtps17ZYr5VDKa18eQrKqmzsuf/8pWswyxJYuh4
         CfVEZJtQRfhsKbxkY907+06Bu9Pa4FzUwaZEFtxAuYIDp6frI3GRRCKV76yAYL3Fhqhq
         GtvQ==
X-Gm-Message-State: ACrzQf0IU5X+a3zRE/uQMMazXcv3ZqJ2MAz1NuaKiS2QAZR9EvyEC2md
	hUn5v4RUxTV3meGpToYwsguS5A==
X-Google-Smtp-Source: AMsMyM5foMFwR0Hx4cCiSgfSNDr9y0WYH1TUU9n5gfp9eWV4TH1N/thdE0/yWIOeEcygQIaoBbk4EA==
X-Received: by 2002:a05:620a:b8d:b0:6ce:1be3:fee7 with SMTP id k13-20020a05620a0b8d00b006ce1be3fee7mr2066217qkh.725.1664457795027;
        Thu, 29 Sep 2022 06:23:15 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id ci19-20020a05622a261300b0035d57445127sm3666371qtb.47.2022.09.29.06.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 06:23:14 -0700 (PDT)
Date: Thu, 29 Sep 2022 09:23:13 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20220929132313.vkw3w34xulowpebq@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <YzWVJpqNq4UeeaoH@kroah.com>
 <92c43f2b-c89d-cb9b-a7ce-777171258185@gmx.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92c43f2b-c89d-cb9b-a7ce-777171258185@gmx.com>

On Thu, Sep 29, 2022 at 01:09:35PM +0000, Artem S. Tashkinov wrote:
> Keeping the website up and running requires next to zero human
> time/resources, that's not proper maintenance.

I'm just going to let this one slide -- but so you know, just keeping spam
hidden/deleted on bugzilla.kernel.org takes 5-10 minutes out of my day. Heck,
I even wrote a script for this:
https://git.kernel.org/pub/scm/linux/kernel/git/mricon/korg-helpers.git/tree/bugzilla-junker.py

> The components/subsystems/developers haven't been updated in over a decade
> which results in a bug tracker which is nearly useless.

Nobody's asked, and it's not the job of IT folks to figure out what these
should be.

> People often file bug reports under "Other/Other" and no one is notified of
> anything.  I don't even want to touch on the fact that the  Bugzilla version
> the website is running is terribly outdated.

It's not. We're running 5.1.1. The latest is 5.1.2 (and it breaks in subtle
ways, which is why we're not running it).

Again. This situation is not a tooling problem. It's a "nobody wants to do
this because it's boring and unglamorous" problem.

-K

