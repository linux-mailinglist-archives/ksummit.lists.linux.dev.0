Return-Path: <ksummit+bounces-934-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC32601A8A
	for <lists@lfdr.de>; Mon, 17 Oct 2022 22:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2687D1C20973
	for <lists@lfdr.de>; Mon, 17 Oct 2022 20:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408984A08;
	Mon, 17 Oct 2022 20:47:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B707F
	for <ksummit@lists.linux.dev>; Mon, 17 Oct 2022 20:47:34 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id g11so8541791qts.1
        for <ksummit@lists.linux.dev>; Mon, 17 Oct 2022 13:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OtWVZweAAWnRcixYheN70Qvehd1+rrCwMcjYRhIlb2Y=;
        b=MZVxUi2GZh5IohthQ9cj4T4ufBqhUpgZsikK5sJpm4pg+8AQjwDWGpXkFJbTK0IxOJ
         4+857XGGY9ybPZsnTkZXdhYBMOf1bKa/N/gJacVtaAYmmr3/dZg3DlEzJswZjvaJ8j7W
         hCWA8lZpfeCTBep9CjBOyraqrtb/Flf5GHbNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtWVZweAAWnRcixYheN70Qvehd1+rrCwMcjYRhIlb2Y=;
        b=1qY6ZAYPP16TNfv5+Gu7P5jyayke2Yev75fYiZyik5XQP/Y+QQkz97ckXzUm7Zvga3
         0jsNWRtcFq1uXHN7oXKb3JwcTNVL1pO4nmrXwfl1jhcPUnOIB8Lfx0ga/cA8EBiSJ/vP
         sxgtc6WZU7xcGnWCyP+fmntyWwUpm8eciSjOhvPSXqeKa+qZIaIHY0x91byqEMRHw6Nw
         JKb0lxEOTbqarlu25VRA0W8jJ9KrIR0Z750TFG7XsjrpI9JBeGzrZsaLSMeocbW78Row
         AQyC5AIVFPKXmxFT4BjI1ar54lEsazNiKrej2hICtwKD0R5kkpvjNBQMWfmW7SHhgR43
         /itQ==
X-Gm-Message-State: ACrzQf2qdf03p5UckyJyfdZpermPOrBI8AgD28rvS7izuWjClyY4N2Fu
	UuPPDDpdGinc7DWKdzFlhreMNw==
X-Google-Smtp-Source: AMsMyM6bGvvUOBD+yB2ss1Ep6dXWrACiISmGohsGN3hvvqeUTPBZj3iH2hceHJFuDnSmiAUDaKUpFQ==
X-Received: by 2002:a05:622a:1650:b0:391:b2cb:6d42 with SMTP id y16-20020a05622a165000b00391b2cb6d42mr10346836qtj.643.1666039653567;
        Mon, 17 Oct 2022 13:47:33 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id f7-20020ac84707000000b003431446588fsm588639qtp.5.2022.10.17.13.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 13:47:32 -0700 (PDT)
Date: Mon, 17 Oct 2022 16:47:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221017204731.a7rixhqlqmhlntvl@nitro.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <f0412b37-fac0-c3f5-9877-0460a027e109@leemhuis.info>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0412b37-fac0-c3f5-9877-0460a027e109@leemhuis.info>

On Mon, Oct 17, 2022 at 03:57:17PM +0200, Thorsten Leemhuis wrote:
> > Here's my counter-plan, which builds on top of yours.
> 
> Is this the agreed on path forward by silent agreement? And if so: who
> will actually shepherd this? I just wonder, as it sounded to me that
> Konstantin would be happy to take care of the bot-related stuff, but
> leave the rest to somebody else.

Indeed, I need to do most of the preliminary legwork. I will start by creating
a public-inbox feed of all bugzilla comments, which is something I was
planning to do for a while anyway. Once that is in place, I can build on top
of that to add a two-way bridge to replace bugzilla's native (and rather
limited, in my experience) email bridge implementation.

Once I have this in place, we can consider what next steps should be taken.

-K

