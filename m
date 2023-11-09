Return-Path: <ksummit+bounces-1202-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4277E655A
	for <lists@lfdr.de>; Thu,  9 Nov 2023 09:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8376B2811D0
	for <lists@lfdr.de>; Thu,  9 Nov 2023 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AFCD28F;
	Thu,  9 Nov 2023 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBa7PI+C"
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1710976
	for <ksummit@lists.linux.dev>; Thu,  9 Nov 2023 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c504a5e1deso7318831fa.2
        for <ksummit@lists.linux.dev>; Thu, 09 Nov 2023 00:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699518740; x=1700123540; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=olXNsHF+WcataRZJJbpRKKdeOv9KXslbyQLDfWTsta8=;
        b=NBa7PI+CQjswfEG04N827DNPbU4wu6CFYzqX/P89ARwW9b2NDa7IIuqMPrAcXFktyX
         Yr1EHtsugIf8u8XU7eT9HCA1uE5aHK/56tDY0dzM0zLIJjNhYCyHlQYg+CsUdCGuS1Pb
         CRYp7JFIGw/SsK8HrBTn8bEJSP6tCoIu8Ey02FbAZt4jLqD7wudw01U3r9QD8WaJDyg9
         wvMkSE2E9qgWDpAl5zJOswZbA4cBMDTfXGBtD63cUWKBUPhWWCG+7bXUmT6nLgIYGchR
         qUfIx+teDbLAppb5BkF+XO5I+Z0Ej/5K9e+RWz/mWqGQ6Un5qRdzyCLDxJWSJ1lPjJzj
         0c3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699518740; x=1700123540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olXNsHF+WcataRZJJbpRKKdeOv9KXslbyQLDfWTsta8=;
        b=Gdz7pk7N6BHRZ0SumdmMyGf+BMF0+cQQxDuJ9Z7+OWPFdQCBBwyV1j0VYJL2Tq+QB/
         xl+c+CClbAkiX415rPP+AYKzf/tbB0xTpQoi/YLI+lY4f+7X4z7b9+32zyHJkaDzwQdE
         jzh+8dUPXjgFHHO8Lph8OZVcqSRPya+UA6g4AYB0YuZLz1NFyu59n4RDxGmeF+kfAio5
         WR2AeaseQL0SVBopV7l65qYRbMU+/zW9igdccTOB8L5pNL75h45lEmCFn8T0WghUmGkd
         8aYzT14QEHNsOuVWToZTqtX99+/ru/Kfu8Cjh+QgGe5oOfatt+VctJs4jJXrB+QoeR/8
         cWKw==
X-Gm-Message-State: AOJu0YzcCmFfPOdTBmJfz0EvpRsLau0dPt56Bev0cNjAVnpjC2fAnxf+
	j7piuMDvP8KbgFtvrJkcBgAQfg==
X-Google-Smtp-Source: AGHT+IHPYUUGydyOTTPQCZ+vHk8cAkBPFvhtaMQ30yJZW2JvdICFmi8uPw02KfHr/TlMX7PzWw6BMg==
X-Received: by 2002:a2e:9919:0:b0:2bc:b9c7:7ba8 with SMTP id v25-20020a2e9919000000b002bcb9c77ba8mr3563214lji.43.1699518740170;
        Thu, 09 Nov 2023 00:32:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c1d8b00b003fe15ac0934sm2565356wms.1.2023.11.09.00.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 00:32:19 -0800 (PST)
Date: Thu, 9 Nov 2023 11:32:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Joe Perches <joe@perches.com>, Mark Brown <broonie@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108140415.46f84baa@gandalf.local.home>

On Wed, Nov 08, 2023 at 02:04:15PM -0500, Steven Rostedt wrote:
> 
> Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
> but I prefer the discussions to be done on LKML.
> 

I had no idea that how tracing worked...  I normally strip out mailing
lists from my patches if I think they're not necessary so I seldom CC
lkml.  In years past, there used to be a lot of complaining about CC'ing
too many people so I try to trim the CC list when I send patches.

Networking doesn't need to be CC'd about wireless patches.
Drm doesn't need to be CC'd about amd gpu driver patches.

And for bug reports, I only ever CC one lore mailing list.  (For zero
day bot stuff, the bot chooses the CC lists).

regards,
dan carpenter

