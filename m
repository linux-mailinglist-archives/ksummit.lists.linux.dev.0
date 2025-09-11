Return-Path: <ksummit+bounces-2350-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CE0B532CF
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 546495A34ED
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CCCC313287;
	Thu, 11 Sep 2025 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VhF3vQrt"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7134015746E
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595222; cv=none; b=Kcj0MBae4GAgFcPeL0Eg8mYHEXQkDSXVDmggyisZFzSXHBx+IGrHIiUpw9VDILTwaeNWQcnaam8LX/e3xTUEVMoS6Uoay3+ER9O8Oh7WejnxjzuoM3cRQtA4ygtjsOOQwhv0mc2Dk3O6irCgxQwQaFB5NMuZYxrcW+RUOPFu3vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595222; c=relaxed/simple;
	bh=byQVxAlbbjx+eOyCCy81iEoP4ZNqx0cCpg1M2odd7fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwNrZoLQDfmBMhkc7orU4SJYyc0XsVPf7HpctKpM/EzArrs2BVjBd2p5vW7kVxzadKcuPKgAhrB4a9pHtZ+salSpdzmm6nwUu5ugIGF29qp2TglJi6Fo5JmnXfBdOUXpFl4taGh1JZ7hMxRafA3e722PkbRaVdHtLI9+B+c1v1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VhF3vQrt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4692F666;
	Thu, 11 Sep 2025 14:52:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757595144;
	bh=byQVxAlbbjx+eOyCCy81iEoP4ZNqx0cCpg1M2odd7fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhF3vQrtSOaZnjFxEY0WPKA0Uiaal4XU63r8ap34Eep22XbQlalD4dsXyNsGjRv6z
	 UlJwIfZKhKiHXWiH40JK0a9uwoxKCmoDTt002UHXVfIS7ZwBLQ+PEahNBECooHgU6O
	 XittGgaHGWawJ8/s1vULzBZc3Ago7+7eaCb2jj5k=
Date: Thu, 11 Sep 2025 15:53:14 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <20250911125314.GD8177@pendragon.ideasonboard.com>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <802da088-2cb8-4e7d-a251-7872bfdd6b45@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <802da088-2cb8-4e7d-a251-7872bfdd6b45@kernel.org>

On Thu, Sep 11, 2025 at 02:47:23PM +0200, Krzysztof Kozlowski wrote:
> On 11/09/2025 14:27, Laurent Pinchart wrote:
> > On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:
> >>
> >> Why is that a problem?
> >> ======================
> >> Patch was reviewed on the list day X and applied by the sub-maintainer.
> >> Then for two, three or four weeks, this patch is not being in the
> >> linux-next means:
> >> 1. Limited or no build bot coverage.
> >>
> >> 2. No actual integration testing, even if it is just spotting early
> >> merge conflicts.
> > 
> > This has prevented me from noticing an integration issue with DT
> > bindings and DT sources in at least one occasion, so I'm interested in
> > improving the process.
> 
> Ack
> 
> >> 3. No wide community testing.
> >>
> >> 4. Contributors cannot base their patchsets on linux-next for
> >> convenience, but need to find each sub-maintainer tree and pull it. For
> >> few cases (see further) these sub-maintainer trees are not documented in
> >> MAINTAINERS, so it is impossible for contributor to rebase on current
> >> maintainer's tree!
> >>
> >>
> >>
> >> Identifying the patches
> >> =======================
> >> There are two cases here for patches committed by sub-maintainers, but
> >> never fed to next:
> >> 1. The upstream maintainer took them via pull request.
> >> 2. The upstream maintainer rebased everything - changing commit date (to
> >> add their own Signed-off-by? otherwise why would you rebase a pull
> >> request from someone you trust?).
> > 
> > I've heard a maintainer saying that Linus doesn't like subsystem trees
> > to have lots of merges. Any help debunking that would be appreciated.
> 
> I think I was never corrected, nor were my upstream maintainers, so two
> levels of indentation is for sure not too much. And that would be the
> case for you, right? Your upstream is Hans, whose upstream is Linus?

Hans and Mauro, yes.

> > Linear histories have upsides, but rebasing causes pain. drm-misc is one
> > case of linear history with limited pain: with dozens (hundreds ?) of
> > committers, patches are pushed to drm-misc pretty much right away once
> > they're approved, and they end up in linux-next. Committers do not hoard
> > patches in their private trees for weeks or even days before pushing to
> > drm-misc. The linear history is in this case likely a good compromise:
> > it simplifies the workflow for committers, while not introducing rebases
> > down the line (the only rebase operations happen right away when a
> > committer picks a patch and loses the race with other committers to push
> > it to drm-misc).
> > 
> > For subsystems with workflows based on pull requests from
> > sub-maintainers, I say way more downsides than upsides in
> > cherry-picking/rebasing.
> 
> Plus rebasing looses the information about signed tags. When you send
> the pull request to your upstream with signed tags and this gets
> rebased, all the trust is purely on upstream maintainer. Your actual
> pull is visible only in SoBs, but not itself.

It also possibly loses the information about what base the commits have
been tested on. That's not relevant for patches I pick from the list,
but for work that I author myself and test before sending the pull
request, that information is lost.

> >> Short stats for case (1) - no rebasing
> >> ======================================
> >>
> >> I collected commits present in today's linux-next, but not present in
> >> ~two weeks ago. These are the commits which appeared for broad testing
> >> in the last two weeks.
> >>
> >> Then I dropped from above set all commits with commit date newer than
> >> the next two weeks ago.
> >>
> >> This gives us set of commits:
> >> 1. Which were committed some time ago, like a month ago,
> >> 2. But they appeared in the linux-next only recently or were rebased.
> >> 3. Then a manual look by subject (not automated yet) to be sure commit
> >> was not rebased.
> >>
> >> Where were these commits? Why maintainers hoard them instead of
> >> releasing to linux-next?
> >>
> >> Currently that is around:
> >> git rev-list --before=2025-08-27 next-20250911 ^next-20250829 | wc -l
> >> 133
> >>
> >> `git show --no-patch --format=fuller` on above list
> >>
> >> And here is the example output of such commits still not in the
> >> next-20250829:
> >>
> >> Author:     John Harrison <John.C.Harrison@Intel.com>
> >> AuthorDate: Fri Jun 13 20:02:22 2025 -0700
> >> Commit:     Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> >> CommitDate: Thu Jul 3 14:05:10 2025 -0700
> >>
> >> Author:     Arnd Bergmann <arnd@arndb.de>
> >> AuthorDate: Thu Aug 7 09:21:28 2025 +0200
> >> Commit:     Oliver Upton <oliver.upton@linux.dev>
> >> CommitDate: Fri Aug 8 01:28:57 2025 -0700
> >>
> >> commit 0c6b24d70da21201ed009a2aca740d2dfddc7ab5
> >> Author:     Jason-JH Lin <jason-jh.lin@mediatek.com>
> >> AuthorDate: Mon Jul 28 10:48:50 2025 +0800
> >> Commit:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
> >> CommitDate: Wed Aug 13 23:50:06 2025 +0000
> >>
> >>
> >> Short stats for case (2) - rebasing
> >> ===================================
> >> I don’t have statistics for these cases, because sub-maintainers’ trees
> >> are not in linux-next, and the upstream maintainer changes the commit
> >> date during rebasing.
> >>
> >> But such cases do exist (I dug them out, even though maintainer trees
> >> are not listed in MAINTAINERS file but pull requests are on the lists):
> >>
> >> Author:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> AuthorDate: Thu Aug 8 22:41:02 2024 +0200
> >> Commit:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> CommitDate: Wed Aug 14 16:42:57 2024 +0300
> >>
> >> Above commit is not in linux-next still, even though it was committed
> >> month ago.
> > 
> > Can you provide the commit ID ? It's hard to check what happened without that.
> 
> Apologies, that was my brain looking at wrong tag. All is good from your
> side. See my response with D'oh...

-- 
Regards,

Laurent Pinchart

