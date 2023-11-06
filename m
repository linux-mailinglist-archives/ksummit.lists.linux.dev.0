Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98457E28BD
	for <lists@lfdr.de>; Mon,  6 Nov 2023 16:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB20F1C20C55
	for <lists@lfdr.de>; Mon,  6 Nov 2023 15:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BE228E0F;
	Mon,  6 Nov 2023 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F8tmy15e"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891F28E07;
	Mon,  6 Nov 2023 15:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B264C433C7;
	Mon,  6 Nov 2023 15:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699284802;
	bh=scLYA2xHpD8TJDZ2tmePHaDPpLiKTAdohjVL5PgfmLM=;
	h=Date:From:To:Subject:From;
	b=F8tmy15eHIreBRWjK3IUBflI3SngFOcQkgvq8Nx5wEM7npKQA2Eq+hx0HfUwiEi0M
	 jqLUC6VWmtdkKXzVvM0RcptNR2vNIvOaiiVriGPindveQhSiHEi4F6s869Va8jMp1k
	 jX8eBRtY8GNR4H9uGKcrfRSnaz6rMH8rz8+CwHiU=
Date: Mon, 6 Nov 2023 10:33:21 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, ksummit@lists.linux.dev
Subject: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

About 70% of all vger traffic is linux-kernel@vger.kernel.org ("LKML"), which
is explained by the following 2 facts:

1. There are ~2900 subscribers to that list
2. It is added to all patches because it has "F: *" in MAINTAINERS

In the past month alone that list received 33,000 posts, which translates to
about 3.1 million messages delivered daily. This has pretty critical
downsides:

- due to the sheer volume of messages, LKML is generally seen as useless for
  holding any actual discussions
- people tend to subscribe gmail accounts to it and then filter out what they
  don't want
- due to gmail's quota policies, this generally results in anywhere from 50K to
  200K messages stuck in the queue all trying to deliver to gmail and being
  deferred with "this account is receiving too much mail"

For this reason, I propose switching the "F: *" entry in MAINTAINERS 
("THE REST") to patches@lists.linux.dev instead. This list differs from LKML
in the following important aspects:

- it allows unrestricted posting, but
- all subscriptions must be pre-moderated, with the goal to only allow bot
  accounts to receive patches sent to that list (e.g. currently only the 0-day
  bot is subscribed)
- it is made available via public-inbox/lei and anonymous POP3, so those who
  want to still be able to have it delivered into their Gmail inbox will be
  able to set it up via POP3 import functionality (docs forthcoming)

This should improve the situation as follows:

- reduce the traffic seen on LKML to more reasonable volumes
- eventually get things to the point where sending something to
  linux-kernel@vger.kernel.org will be a reasonable action and not just
  screaming into the void (spitting into hurricane-force gale?)
- unclog the outgoing queues and speed up mail delivery for everyone

Please let me know your thoughts. I will also be happy to discuss this at the
upcoming kernel/maintainer summit.

-K

