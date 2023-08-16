Return-Path: <ksummit+bounces-998-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C777E850
	for <lists@lfdr.de>; Wed, 16 Aug 2023 20:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55B831C21169
	for <lists@lfdr.de>; Wed, 16 Aug 2023 18:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD089174FE;
	Wed, 16 Aug 2023 18:08:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E702820E7
	for <ksummit@lists.linux.dev>; Wed, 16 Aug 2023 18:08:10 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-58c531d9a4aso1699577b3.1
        for <ksummit@lists.linux.dev>; Wed, 16 Aug 2023 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20221208.gappssmtp.com; s=20221208; t=1692209289; x=1692814089;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6vg6N9cp6iq7XEDMzsy5Z042Z6L6+JLny/Hp3cSBOs=;
        b=QXz+f8Bv7HnqutVhLXu+KhNT9l2VDHCmV6oZnzmV/Xnf+taGEW9OOqhnBltl4lA/r9
         PCKpVihqQQXeC5Gc/bd1dN69ZFg4kjw7h+SJkBCG5APqBJ6h1ih48//CqD67ymeZo3n+
         4V++2IzPRqtwVgmK7t1j6SbVBYrhxYRKLluvNN1DcJMwZzGfUfgj3/Hmud9j0Q6FijYe
         bkiV9S+3F9rs3dP5reHMTDEOqLr3n05tBH9tMI/b6Js7AzwLC3h0HWnXL9AhpW2aPvKX
         1EpcKtv+IBuHg2JRWi3d6lswBYZem60yLItyWJd1smIfS6XDqRBN+ewhyMLxBAYXM0FL
         /vGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692209289; x=1692814089;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6vg6N9cp6iq7XEDMzsy5Z042Z6L6+JLny/Hp3cSBOs=;
        b=WgNb9Wmzcq2ZvNFpHTgwZsf4wo56C08y7ker5cw/4loaf1Uv86GQHuV9lwuVyOZMem
         Q3BNVIazUMrXNfb0vcW9ko1HWnDjzbhUgt3+hL6WAfYEvbPIzUCt1oc/NsIIOSUwNQyK
         2RDu2BWAChQ0aUjhbxlu/vOghXU3OqjahTnDG64HqRwfzOIuckg4kiuU7chJDNcjrOlA
         h79b+d2YCKawwDcAbH4AvBY4SJWq/+ko01QbaMdCueFEdTQdDa0YWZ9xtg6yVCfQpJbI
         KGQlA/LmetfaRDdAsiDCpnEL14NUsF0+akKER+L8BiTYTPZ5T8tIUz720QDAuVCPLdgn
         vtIw==
X-Gm-Message-State: AOJu0Yz0Rk6zGJqr0YloHmrq5Mic2N0eqFIlbKWWm61KwWX3tLYT8PCv
	ba/RrNlYKPM1Q3mb5wt9lJ08FBC9gFwNrcLwPcdF6A==
X-Google-Smtp-Source: AGHT+IGEBEedBep7wUkwV37dk0gToha9VwBvutFzPHogDWp3Aex86z/BbsLEKl4/jNkwQLlNcU0fBw==
X-Received: by 2002:a0d:db88:0:b0:56c:f0c7:7d72 with SMTP id d130-20020a0ddb88000000b0056cf0c77d72mr530468ywe.4.1692209289382;
        Wed, 16 Aug 2023 11:08:09 -0700 (PDT)
Received: from localhost (cpe-76-182-20-124.nc.res.rr.com. [76.182.20.124])
        by smtp.gmail.com with ESMTPSA id g63-20020a0dc442000000b005772fc5912dsm4158455ywd.91.2023.08.16.11.08.08
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 11:08:09 -0700 (PDT)
Date: Wed, 16 Aug 2023 14:08:08 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230816180808.GB2919664@perftesting>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

This is a topic we're beating to death but haven't really made decent progress
on WRT real solutions.  I know I have advocated for adding even more
responsibilties to maintainers plates, which isn't really helpful.

There is a lot in this email, so I suppose choose your own adventure when it
comes to what we think is relevant to discuss.

Maintainers/long time developers are burning out.  At the same time there's
frustration from new comers who have trouble getting their patches accepted.  We
have instances of arguments between longtime developers which leads to more
frustration because it drags on the development process.

I have argued for the last few years that maintainers should be taking a more
active role in the social side of our development process.  Be the grownups in
the room and help mitigate these conflicts before they sour relationships.

But this just adds to the long list of things that maintainers already need to
do.  Oftentimes they are the only reviewers, testers, and main developers rolled
into one.  We have an increase of automated testing, which while is a net
positive, adds to the stress of maintainers who view these reports as their
personal responsibilty to address.

We all work differently, so having big sweeping solutions is a non-starter.
However I think there are things we can learn from eachother to encourage
different thinking and thus result in a smoother development experience for all
of us.

Patch review: Obviously more people the better, encouraging review by trading
reviews for having developers patches reviewed is a good method, but this only
works for sufficiently large communities.

Automated testing: This doesn't replace review, but it can help add confidence
when you're accepting patch reviews from less experienced members.

De-prioritize automated reports: Syzbot is great, but the failure cases can be
sporadic and difficult to reproduce.  Things that are bisected to a specific
patch are obviously easy to tackle, but don't let yourself get overwhelmed by
syzbot, they're good things to hand to new developers to cut their teeth on.

Maintainer groups, not sole maintainers: We all have things going on, build up
people you trust and develop a way to spread the maintenance load.

Automate everything: I hate email, that is no secret, but even with email we can
automate a lot of things.  The btrfs team built out the GH CI so developers can
drive their own testing, spreading the load.  Eventually I hope to get to the
point where the merging of patches is automated away so we don't have to deal
with those mechanics.

Developing strategies to handle the more mundane tasks of managing our projects
will help free us to engage better with our communities, and guide people to be
better developers, feeding back into the ecosystem that will help reduce the
pain.  Thanks,

Josef

