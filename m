Return-Path: <ksummit+bounces-2347-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE7CB532AE
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9BC5A3026
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7532D5949;
	Thu, 11 Sep 2025 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2OZrs4/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA1D32143B
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594846; cv=none; b=MgSQuOg04Mf2KMVclOnz2FeAghi3VyniuuAEvlSJfCep3jQXJlEQCZrJiDMBAq0b9Gf6XKp2WcgOBprGmAf7w1HxcpuvgBGtj7KA7s7r2DTiER012WKoJC72cSgy+NOsm6RDMYxaXNXq19QDJXNJwXpJtnqIahpUZQ/TxrVYeGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594846; c=relaxed/simple;
	bh=QB/pedLHF0jXrbSgUEiwy7ngoUPz23zhbAsf3+gaZL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cevexL7FMk05GuE4+ZHvEoppyg6Vk+hlhB7xkLGFyPz646svR0p7ZOMxIEQytLGecsvLtc632wfZ4c65jytS+jwlNiEC/wElyZUxRnzHrT44bM9AczNrl4HlVLD9gmj7OPCnbcMl4HBahyB6uAzxcmjBtrxAaiSxLq+xjtLN11M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2OZrs4/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A023AC4CEF0;
	Thu, 11 Sep 2025 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757594846;
	bh=QB/pedLHF0jXrbSgUEiwy7ngoUPz23zhbAsf3+gaZL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N2OZrs4/tvgr3fr/4cfJpMwGMCtsGkNHjCg/Eu7kMZSRDXGIXbcMH8vCLRoqU/IIo
	 M6t/hVpRLO4C6VzrMa0XbWAFwB5F/aWk0L1emwONx85eroMqH/4yKO3SPX1kGLS7Ie
	 j0PTPj1wHjIkCNjIbUyxMZt5qyjY/zQ4eDEBzlVKrmyCW4ytbR01z/VelxxiRa2ftu
	 AqUUpLkvL7RHNYV6Ez79lxO3LLm+gIygDgivhmqgUGgDi7VvRUxo6cWvkWAT/cd8ji
	 PKIwHS0IuPAnNS4O79Fi2g8fS8Va6XeC4fJlL/qMBTpZ0bDv4OLctq4/cuPLCYXwIk
	 yyRys/JdIQysw==
Message-ID: <802da088-2cb8-4e7d-a251-7872bfdd6b45@kernel.org>
Date: Thu, 11 Sep 2025 14:47:23 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: ksummit@lists.linux.dev
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250911122711.GC8177@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/09/2025 14:27, Laurent Pinchart wrote:
> On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:
>>
>> Why is that a problem?
>> ======================
>> Patch was reviewed on the list day X and applied by the sub-maintainer.
>> Then for two, three or four weeks, this patch is not being in the
>> linux-next means:
>> 1. Limited or no build bot coverage.
>>
>> 2. No actual integration testing, even if it is just spotting early
>> merge conflicts.
> 
> This has prevented me from noticing an integration issue with DT
> bindings and DT sources in at least one occasion, so I'm interested in
> improving the process.


Ack

> 
>> 3. No wide community testing.
>>
>> 4. Contributors cannot base their patchsets on linux-next for
>> convenience, but need to find each sub-maintainer tree and pull it. For
>> few cases (see further) these sub-maintainer trees are not documented in
>> MAINTAINERS, so it is impossible for contributor to rebase on current
>> maintainer's tree!
>>
>>
>>
>> Identifying the patches
>> =======================
>> There are two cases here for patches committed by sub-maintainers, but
>> never fed to next:
>> 1. The upstream maintainer took them via pull request.
>> 2. The upstream maintainer rebased everything - changing commit date (to
>> add their own Signed-off-by? otherwise why would you rebase a pull
>> request from someone you trust?).
> 
> I've heard a maintainer saying that Linus doesn't like subsystem trees
> to have lots of merges. Any help debunking that would be appreciated.


I think I was never corrected, nor were my upstream maintainers, so two
levels of indentation is for sure not too much. And that would be the
case for you, right? Your upstream is Hans, whose upstream is Linus?

> 
> Linear histories have upsides, but rebasing causes pain. drm-misc is one
> case of linear history with limited pain: with dozens (hundreds ?) of
> committers, patches are pushed to drm-misc pretty much right away once
> they're approved, and they end up in linux-next. Committers do not hoard
> patches in their private trees for weeks or even days before pushing to
> drm-misc. The linear history is in this case likely a good compromise:
> it simplifies the workflow for committers, while not introducing rebases
> down the line (the only rebase operations happen right away when a
> committer picks a patch and loses the race with other committers to push
> it to drm-misc).
> 
> For subsystems with workflows based on pull requests from
> sub-maintainers, I say way more downsides than upsides in
> cherry-picking/rebasing.


Plus rebasing looses the information about signed tags. When you send
the pull request to your upstream with signed tags and this gets
rebased, all the trust is purely on upstream maintainer. Your actual
pull is visible only in SoBs, but not itself.

> 
>> Short stats for case (1) - no rebasing
>> ======================================
>>
>> I collected commits present in today's linux-next, but not present in
>> ~two weeks ago. These are the commits which appeared for broad testing
>> in the last two weeks.
>>
>> Then I dropped from above set all commits with commit date newer than
>> the next two weeks ago.
>>
>> This gives us set of commits:
>> 1. Which were committed some time ago, like a month ago,
>> 2. But they appeared in the linux-next only recently or were rebased.
>> 3. Then a manual look by subject (not automated yet) to be sure commit
>> was not rebased.
>>
>> Where were these commits? Why maintainers hoard them instead of
>> releasing to linux-next?
>>
>> Currently that is around:
>> git rev-list --before=2025-08-27 next-20250911 ^next-20250829 | wc -l
>> 133
>>
>> `git show --no-patch --format=fuller` on above list
>>
>> And here is the example output of such commits still not in the
>> next-20250829:
>>
>> Author:     John Harrison <John.C.Harrison@Intel.com>
>> AuthorDate: Fri Jun 13 20:02:22 2025 -0700
>> Commit:     Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> CommitDate: Thu Jul 3 14:05:10 2025 -0700
>>
>> Author:     Arnd Bergmann <arnd@arndb.de>
>> AuthorDate: Thu Aug 7 09:21:28 2025 +0200
>> Commit:     Oliver Upton <oliver.upton@linux.dev>
>> CommitDate: Fri Aug 8 01:28:57 2025 -0700
>>
>> commit 0c6b24d70da21201ed009a2aca740d2dfddc7ab5
>> Author:     Jason-JH Lin <jason-jh.lin@mediatek.com>
>> AuthorDate: Mon Jul 28 10:48:50 2025 +0800
>> Commit:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
>> CommitDate: Wed Aug 13 23:50:06 2025 +0000
>>
>>
>> Short stats for case (2) - rebasing
>> ===================================
>> I don’t have statistics for these cases, because sub-maintainers’ trees
>> are not in linux-next, and the upstream maintainer changes the commit
>> date during rebasing.
>>
>> But such cases do exist (I dug them out, even though maintainer trees
>> are not listed in MAINTAINERS file but pull requests are on the lists):
>>
>> Author:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> AuthorDate: Thu Aug 8 22:41:02 2024 +0200
>> Commit:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> CommitDate: Wed Aug 14 16:42:57 2024 +0300
>>
>> Above commit is not in linux-next still, even though it was committed
>> month ago.
> 
> Can you provide the commit ID ? It's hard to check what happened without that.


Apologies, that was my brain looking at wrong tag. All is good from your
side. See my response with D'oh...


Best regards,
Krzysztof

