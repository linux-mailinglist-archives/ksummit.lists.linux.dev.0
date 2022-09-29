Return-Path: <ksummit+bounces-789-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACF25EF6F1
	for <lists@lfdr.de>; Thu, 29 Sep 2022 15:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DEEC280D2D
	for <lists@lfdr.de>; Thu, 29 Sep 2022 13:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284D61C37;
	Thu, 29 Sep 2022 13:53:31 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008171C13
	for <ksummit@lists.linux.dev>; Thu, 29 Sep 2022 13:53:28 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id e20so645101qts.1
        for <ksummit@lists.linux.dev>; Thu, 29 Sep 2022 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NFq9wRsaoLbh4oQSllJvLMyhItK0hN2kyKyyofhotcc=;
        b=GzIoyl2hCGKjHugwH/XcQsFFJdGgIazGUTKz5gDoY+qt57jLvFx9O9comYjzZVSGzp
         ypLtpW3zMWHTksKoYY5zkGCtPy3w19IaR7JMgQI2qhhjI32JC66LDQL4qCAy031Nlg5d
         F9KtvlQFUUbR8VZBe060JNviDDHZOzZj0ZTWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NFq9wRsaoLbh4oQSllJvLMyhItK0hN2kyKyyofhotcc=;
        b=7SenybVoXs//5F2XbNSRXs+sYc3ejEkZiEkJUFHSl98ZRjGJEJh9d/LgyQfA7VCCp8
         KPBOeXlSMoxLxIlwhs1uJh6HFO6wxXNKR/LDNnAoB6Aq258ruZ9ZEM6AEGMeq0rjV5MJ
         aZMYZJonoJm0x3/vg44Gt4fV1wpWOOQ0uuSur5vQhITmQPfjxKSHCCJJgDTKboYea5rc
         A/gNjkfTic7LV+4BU5a88LSa8v6x/9fjoBevmBssdxJF90YfulrhUi4X1FY1MNfh19R+
         VNiozpULoNGDbUwtdL6ReAUjv0lV0+P7mXw8qvv8KdD8diLKfvBWzup68D81DoJ0++Ue
         7uzw==
X-Gm-Message-State: ACrzQf3HoXW2AgJnovRYdoxVm1ewhTtnXFbFsyoFc90HhvvHYddZkYgz
	K82EM3U0ypuauksrYyCJB01U2g==
X-Google-Smtp-Source: AMsMyM5T9J57qBDA1T39F0nfFp2aG/oapSlPbrCYqhZrKg51/H+00u4UHzZRnUmBo2c8a0wOv0/YwA==
X-Received: by 2002:a05:622a:390:b0:35d:44ab:c615 with SMTP id j16-20020a05622a039000b0035d44abc615mr2459020qtx.594.1664459607829;
        Thu, 29 Sep 2022 06:53:27 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bq35-20020a05620a46a300b006bb78d095c5sm6087519qkb.79.2022.09.29.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 06:53:27 -0700 (PDT)
Date: Thu, 29 Sep 2022 09:53:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Artem S. Tashkinov" <aros@gmx.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>

On Thu, Sep 29, 2022 at 01:31:49PM +0000, Artem S. Tashkinov wrote:
> To me it sounds like the best way to keep moving forward is simply
> convert git.kernel.org + patchwork.kernel.org + bugzilla to
> gitlab.kernel.org and that will solve all the issues immediately.

No, you will still have all the exact same problems as long as nobody is in
charge of handling incoming bugs. There are plenty of active github/gitlab
projects with thousands of open issues that nobody is working on for the exact
same reason nobody is working on bugs filed via bugzilla -- the right people
didn't see it (or are actively ignoring it, because they are working on
something else).

> That will require of course a ton of work but:
> 
> 1) All the commiters will be automatically present and you can easily CC
>    them

Just like with bugzilla.

> 2) All the kernel directories could be split into components with the
>    respective developers being subscribed to them automatically. There's an
>    issue though: sometimes directories/components are rearranged. Gitlab
>    however is quite powerful, so issues can be easily moved between
>    components.

Just like bugzilla.

> 3) It's gonna be a ton easier to keep track of commits and discuss/review
>    them. AFAIK it's now done using LKML + patchwork.kernel.org and then
>    commits are merged by maintainers. So many places to keep track of.

Now there will be a single place someone can knock out to stop all kernel
development and coordination, subject to countrywide IP blocks, political
influence, etc.

Besides, maintainers already have a single place to keep track of things --
their inbox. If they didn't see something in their inbox, how is it going to
be different when it's a web interface?

> 4) Gitlab probably can be integrated with other gitlabs (at least AMD, Intel
>    and Nouveau drivers are developed on gitlab.freedesktop.org).
> 
> Gitlab simplifies all of that tremendously. Github will work as well but I
> know many people don't like it.

Gitlab is also a commercial open-core project. It is permanently in danger of
being swallowed by some $ENTITY_NOBODY_LIKES, who will for sure look to
prioritize what kinds of things go in to the "open core" part and what kinds
of things are only available with subscription, in order to improve profit
margins.

-K

