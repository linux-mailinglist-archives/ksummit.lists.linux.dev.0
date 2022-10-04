Return-Path: <ksummit+bounces-925-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568555F49AD
	for <lists@lfdr.de>; Tue,  4 Oct 2022 21:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C16280A78
	for <lists@lfdr.de>; Tue,  4 Oct 2022 19:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C034421;
	Tue,  4 Oct 2022 19:24:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68092441B
	for <ksummit@lists.linux.dev>; Tue,  4 Oct 2022 19:24:12 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id cn9so1234114qtb.11
        for <ksummit@lists.linux.dev>; Tue, 04 Oct 2022 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UGv+4Ut0HLLEjpaUAPUVZXaZ900gJu9AykveplMCL1U=;
        b=URvG7DwIubm3/EQ91sUr7I/IZcR0Fhyn+9ZTW+dQQr9NpmeWjM6ahJZObGsJ3U0SiB
         g3p7kThvV4Jq3HV0K0aeEhaDa8gR+gQyU11rYMjBUkgDwmi1+V6eS0hoVnb5xn4/RmNq
         oCN7gfhRM46mNb7BZR8+tN7a9LRWayvP8oW3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UGv+4Ut0HLLEjpaUAPUVZXaZ900gJu9AykveplMCL1U=;
        b=oli1JzV/zq9P1hbrEYlVZptDNH+HYdcjbXDSznGFDu1BSrzf95LNbTpUaJEF3Ihh0i
         OZADg/0f44YePPvfn+03ICTS6TTy6S+7inyXuVzxSFmeLQ3259DQkw/Vi/879pGQQ5OX
         A0SmzOwjetmIKRVYAwGIkss10b3Qqm0QxRRZb/39+iGjhrvVoMPlhm4n+IjMQWPQAx3R
         3dYNmtRTIQorqMq/rLvVBMnsGsM3EljZ/c2BG4m6pXdJaguo4BP5QWYpvWj5zu2y4upv
         077PfdxNoPCMWhw7OjwU/12PfqzyKlokTpe8DKZYgAp3sfuQ+XJ6FhjkTN6/o4ji13S+
         nCXw==
X-Gm-Message-State: ACrzQf126rCXd/waA3jfU6bj1Cov7IT/N0IowYTBJbAbublxaB+ZNjjy
	bYvULdFmfwFsYJwCWjVk+TMLgA==
X-Google-Smtp-Source: AMsMyM7F6US4MHrT1SRGsB2cYTu7Yy8NeSol1EU/9LJMbcPgPun/zAiBU19d8ou6TvWTXeuJMMX5Gg==
X-Received: by 2002:a05:622a:180d:b0:35b:d283:7e65 with SMTP id t13-20020a05622a180d00b0035bd2837e65mr21012590qtc.106.1664911451349;
        Tue, 04 Oct 2022 12:24:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id d10-20020ac851ca000000b0038c60a3fa8bsm1075495qtn.85.2022.10.04.12.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:24:10 -0700 (PDT)
Date: Tue, 4 Oct 2022 15:24:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"Artem S. Tashkinov" <aros@gmx.com>,
	ksummit <ksummit@lists.linux.dev>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221004192408.z6gxc7unclm7vbdg@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <87fsg3s8co.fsf@intel.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fsg3s8co.fsf@intel.com>

On Tue, Oct 04, 2022 at 10:21:27PM +0300, Jani Nikula wrote:
> As to bots, one idea would be to go through old & unchanged bugs after
> every kernel release or so, ask to reproduce on the new kernel, and auto
> close if there's no response within some time frame. This could be very
> relaxed for starters, but would start closing all the stale and
> neglected bugs that have crept up that are of no use to anyone.

This is what Fedora does, and I've always felt it creates more annoyance than
good, but if that's the consensus, I'll be happy to implement this.

-K

