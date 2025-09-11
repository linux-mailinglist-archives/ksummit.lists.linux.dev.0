Return-Path: <ksummit+bounces-2333-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A274AB52F1A
	for <lists@lfdr.de>; Thu, 11 Sep 2025 13:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16D237AA1CC
	for <lists@lfdr.de>; Thu, 11 Sep 2025 11:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B664530F54E;
	Thu, 11 Sep 2025 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZx1K93y"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F72DF12C
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 11:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757588663; cv=none; b=Hg0CMFUR8tuGAOMktWlw11i3xgBPXZGMzqycEgEuUjxbnk5aeEag2HuZIzdr5gIZbiPHr3IzYjMl18fUI2GlpWYe3Unai3O1FxZZvkn9ybZZOQtK4U44oyMxXj7yUgCLOlwvfTIn1pNmW+xjC0LdzykprQPoHIsv8V9OqSk2vQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757588663; c=relaxed/simple;
	bh=Qw4QLPdU92Hrbw6z/74IGjNCY8DDirzghXEP0QUnW8w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=RZfDPD5l4ivspm7wBQTDND0xCv/bEb5n/7UhGzLdF0a3d+kR4I8ENbn0tNst3Tzln3fQetNL8/WSy6cQPI5tzaAF9pDzYn72MWLYRAK3FZCA0BP8Hv6aoLPGydElRxpxrTso0g8nedkhJ9kzGkk5Y19qISo0daCuP/zRxhUQQY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZx1K93y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7940C4CEF0;
	Thu, 11 Sep 2025 11:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757588662;
	bh=Qw4QLPdU92Hrbw6z/74IGjNCY8DDirzghXEP0QUnW8w=;
	h=Date:From:Subject:To:From;
	b=KZx1K93yzyhCoDhVEd5MIVJLj4MSmq5weK0iB5v3P9D/aU0NAdWRxD2Uc5Wwpsid2
	 r89FhYZ95boicLjjz0qcXCcZIyo61iRq4yYYaejyerGE3Bq6bOTKoI+Bp0+Jcvc/ne
	 5lYd5XZ+pG3jBt2pjWaopVtQ9/zlWCezMVojE7MkTSvoJM0CwBeI70F282kCKeTJ/l
	 YG5mWv3TU1q2s74xKyuk0YWGRcCQ1kvh6jmbfNpGuXiePOYoMVZUj5sHo+KDCttNEp
	 +WRI0gbrnCdjArUs67y7ECkSQQg6w0DiZFvF0q4IJnU/WqiikqD4yoJxCT+YQkFJWM
	 uqcbg4eHuTDJg==
Message-ID: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
Date: Thu, 11 Sep 2025 13:04:19 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Subject: [MAINTAINERS SUMMIT] Hidden commits from next (aka why maintainers
 hoard them in backpack)
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
To: ksummit@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,


I have noticed at least a few cases where sub-maintainers collect
patches, but their trees are not included linux-next. Or their patches
are not fed to linux-next.

I don’t see a good reason to keep valid, proper patches - collected by
trusted sub-maintainers and intended for upstream submission - out of
linux-next. If a sub-maintainer is trusted in collecting patches and
sending them to the upstream maintainer, these commits should be visible
in the linux-next.

I have occasionally asked sub-maintainers to add their trees to the
linux-next, and sometimes this worked. In other cases it could not work
for various reasons, e.g. workflow of the upstream maintainer or
reluctance to share commits early. These reasons are what I would like
to discuss and, hopefully, improve.


Why is that a problem?
======================
Patch was reviewed on the list day X and applied by the sub-maintainer.
Then for two, three or four weeks, this patch is not being in the
linux-next means:
1. Limited or no build bot coverage.

2. No actual integration testing, even if it is just spotting early
merge conflicts.

3. No wide community testing.

4. Contributors cannot base their patchsets on linux-next for
convenience, but need to find each sub-maintainer tree and pull it. For
few cases (see further) these sub-maintainer trees are not documented in
MAINTAINERS, so it is impossible for contributor to rebase on current
maintainer's tree!



Identifying the patches
=======================
There are two cases here for patches committed by sub-maintainers, but
never fed to next:
1. The upstream maintainer took them via pull request.
2. The upstream maintainer rebased everything - changing commit date (to
add their own Signed-off-by? otherwise why would you rebase a pull
request from someone you trust?).


Short stats for case (1) - no rebasing
======================================

I collected commits present in today's linux-next, but not present in
~two weeks ago. These are the commits which appeared for broad testing
in the last two weeks.

Then I dropped from above set all commits with commit date newer than
the next two weeks ago.

This gives us set of commits:
1. Which were committed some time ago, like a month ago,
2. But they appeared in the linux-next only recently or were rebased.
3. Then a manual look by subject (not automated yet) to be sure commit
was not rebased.

Where were these commits? Why maintainers hoard them instead of
releasing to linux-next?

Currently that is around:
git rev-list --before=2025-08-27 next-20250911 ^next-20250829 | wc -l
133

`git show --no-patch --format=fuller` on above list

And here is the example output of such commits still not in the
next-20250829:

Author:     John Harrison <John.C.Harrison@Intel.com>
AuthorDate: Fri Jun 13 20:02:22 2025 -0700
Commit:     Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CommitDate: Thu Jul 3 14:05:10 2025 -0700

Author:     Arnd Bergmann <arnd@arndb.de>
AuthorDate: Thu Aug 7 09:21:28 2025 +0200
Commit:     Oliver Upton <oliver.upton@linux.dev>
CommitDate: Fri Aug 8 01:28:57 2025 -0700

commit 0c6b24d70da21201ed009a2aca740d2dfddc7ab5
Author:     Jason-JH Lin <jason-jh.lin@mediatek.com>
AuthorDate: Mon Jul 28 10:48:50 2025 +0800
Commit:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
CommitDate: Wed Aug 13 23:50:06 2025 +0000


Short stats for case (2) - rebasing
===================================
I don’t have statistics for these cases, because sub-maintainers’ trees
are not in linux-next, and the upstream maintainer changes the commit
date during rebasing.

But such cases do exist (I dug them out, even though maintainer trees
are not listed in MAINTAINERS file but pull requests are on the lists):

Author:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
AuthorDate: Thu Aug 8 22:41:02 2024 +0200
Commit:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CommitDate: Wed Aug 14 16:42:57 2024 +0300

Above commit is not in linux-next still, even though it was committed
month ago.

Just a friendly note, Laurent, I appreciate your work and I do not want
to point that you committed it incorrectly. In the contrary - your
commit is right, but your upstream maintainer stops you from including
this in linux-next. My aim here is only to discuss and improve the process.


Terminology
===========
1. Sub-maintainer: A person who collects (applies) patches and sends
them via pull request to the upstream maintainer.

2. Upstream maintainer: A person who collects patches from contributors
and pull requests from sub-maintainers, and then sends everything to
Linus (or another upstream maintainer).



Best regards,
Krzysztof


