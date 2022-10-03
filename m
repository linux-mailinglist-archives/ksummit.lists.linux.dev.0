Return-Path: <ksummit+bounces-904-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C4E5F32AF
	for <lists@lfdr.de>; Mon,  3 Oct 2022 17:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 691941C20947
	for <lists@lfdr.de>; Mon,  3 Oct 2022 15:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CBD17D9;
	Mon,  3 Oct 2022 15:37:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE77D17D4
	for <ksummit@lists.linux.dev>; Mon,  3 Oct 2022 15:37:21 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id c19so6743919qkm.7
        for <ksummit@lists.linux.dev>; Mon, 03 Oct 2022 08:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=4TUdHFmO38US6568yTP0OqVuYA8SXcCUcaHPL5GJBFU=;
        b=PTlyWeS31NLqjaTlw+KY83qoDH3YyzTeDyWw8uQv+LwUMWpyvoN/3JNSV+RkGeGPNC
         7tObuMVupQk+MM0gvXycEHmn5lqCF54cptJo+DEC43rpFrzH2Lf3nv5OlFhqYEGVrOTY
         zHdzLcJaCuDQCuGuJsiSBgeFPFWzL55J1SrrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4TUdHFmO38US6568yTP0OqVuYA8SXcCUcaHPL5GJBFU=;
        b=zkC5sr7+5701cj72z/QgZPA3OK0JnLS8m/0sGkZVpldAzwGNdEeCtG1LOYkbG64e5D
         7Rb3PQJGH3cNbxjGvACCeSeeDgHvKCkBjq4KBnUYHca113duKsf2U4fbt+ECIWg707oV
         xETfoAlKKUlerkHehJg5z9cqiC/WFfmiNTjR+i7xmgorj0Zu4XIaGOWr53ZY7//r6Fxv
         gLUyJJOGN4/8m+3jdWSZljj0HfZz+VAszQr9raXhW2K2i/+sfoAj1IeDIBNLMNKXBiie
         EPpVn8EiDtrZ9YfAfNi9s7beNrCX1+n8xyskLjljeFN2f+QA72HiSg8RQCZSRAAKIMk3
         HcVQ==
X-Gm-Message-State: ACrzQf0XpGKzD/pMxVCp2Te7cUatVSGG6CDceLv/2qIhcCJfT1eNcEX9
	Byg7a48ZFWxv1FqA1vJct5peYg==
X-Google-Smtp-Source: AMsMyM6xZRzH+5svctKxIwHBih0k2vYshlZ4CyvgElwEimd5Az8JwxIF+PfcfD4yvSCzvRFEVZCQTQ==
X-Received: by 2002:a05:620a:67b:b0:6cd:1bce:47e1 with SMTP id a27-20020a05620a067b00b006cd1bce47e1mr13904209qkh.666.1664811440556;
        Mon, 03 Oct 2022 08:37:20 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id k19-20020a05620a415300b006ce60f5d8e4sm12058244qko.130.2022.10.03.08.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 08:37:20 -0700 (PDT)
Date: Mon, 3 Oct 2022 11:37:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>, Theodore Ts'o <tytso@mit.edu>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Greg KH <gregkh@linuxfoundation.org>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221003153718.o7fhrain5fnwwu3l@meerkat.local>
References: <e98597e8-9ddb-bbf0-7652-691327186a92@gmx.com>
 <YzmBjgXq9geMnL1B@mit.edu>
 <79bb605a-dab8-972d-aa4a-a5e5ee49387c@gmx.com>
 <20221002141321.394de676@rorschach.local.home>
 <6de0925c-a98a-219e-eed2-ba898ef974f8@gmx.com>
 <20221002180844.2e91b1f1@rorschach.local.home>
 <3a3b9346-e243-e178-f8dd-f8e1eacdc6ae@gmx.com>
 <YzoY+dxLuCfOp0sL@ZenIV>
 <b032e79a-a9e3-fc72-9ced-39411e5464c9@gmx.com>
 <YzqjfU66alRlGk5y@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YzqjfU66alRlGk5y@kernel.org>

On Mon, Oct 03, 2022 at 11:55:25AM +0300, Mike Rapoport wrote:
> If I'm not mistaken, bugzilla lets CC people explicitly. How the database
> of emails in bugzilla would help choosing the right people to CC better
> than MAINTAINERS?

It can't, actually, which is I think is the crux of misunderstanding here. I
think what Artem is proposing is to *auto-create bugzilla accounts* for anyone
who shows up in MAINTAINERS, so that they can be cc'd on a bug report.
However, everyone understood this as "add these people as default assignees,"
which is not the case.

If we auto-create accounts for MAINTAINERS, that would allow them to be cc'd
by an actual human being triaging bugs, but won't lead to any discernable
increase of bugzilla mail.

Artem, please correct me if I'm wrong.

-K

