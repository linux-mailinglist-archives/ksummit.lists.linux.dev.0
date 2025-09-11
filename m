Return-Path: <ksummit+bounces-2349-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14EB532B7
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30CFD3ACA76
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAF0322DB2;
	Thu, 11 Sep 2025 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fkgut9LS"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB599322DB5
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594975; cv=none; b=kXxjD+sba7DMfoDsbB+aaeMiCw64ZV/NidTH+5/aPKajDvPEz+MHNnWAW9ZNqzeZhhUDhkBHzMNgUsv78+ofYf2E4iJBEPy9bTPs7yC2t6X18rhc2w2poBgM6HljkrG5OukFJVQwmQLjTtZHQg+aph7GjgdFPkq4lnErG6PoIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594975; c=relaxed/simple;
	bh=zli78H3u7buqMBfr/1z5LbkO/bPmiCFh93VTKNJygac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSI78BJeAH0HwwopufKs+8i18NdCzTSS2jqjkrztP/hDX2+TwUU0dqwDdQ5zupO+vAoPRencosnX0Yi3QbYGiGb7a4IXdrqvwoe3pl5qmGxFIBTEPHpA3F8teA2wm71R2nqgms24wOJez6YMmzo9iC6GDBl7b2gJvXDkskK3SZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fkgut9LS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7735CC4CEF1;
	Thu, 11 Sep 2025 12:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757594975;
	bh=zli78H3u7buqMBfr/1z5LbkO/bPmiCFh93VTKNJygac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fkgut9LSTCb2TtVH43vGL+xqOKzEJHaXYrUIdK9Wyc6irB1JS1uMx+pXlTGFBF58J
	 HN3rkZdkSND6tt/Irvj7QTLC5GnwZ8JpTLGlgDUBcQo6uzXsbFhnb91ZHcwgxstQSL
	 fvg/nD5hKkSZdTN2l0Mhqet8dppiidxa3jaTV6MNAxeDGrhVdPa0mTHuPI5Y7yR3Os
	 Yb69+rGlA4oWFNsdChIPYf4abupgO08NL9IxpjrmGwS54du8fEES5jURqc1C8JOptc
	 +22whDzLfljkqywspC+PvMTuuK+6vUUUfjzJlgeHtrQ1Bosc5WgvG1soPbQFilSMwP
	 cV+BcnkY3JGzA==
Date: Thu, 11 Sep 2025 08:49:34 -0400
From: Sasha Levin <sashal@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <aMLFXhAVQE1VJ4ff@laps>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>

On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:
>Hi,
>
>
>I have noticed at least a few cases where sub-maintainers collect
>patches, but their trees are not included linux-next. Or their patches
>are not fed to linux-next.
>
>I don’t see a good reason to keep valid, proper patches - collected by
>trusted sub-maintainers and intended for upstream submission - out of
>linux-next. If a sub-maintainer is trusted in collecting patches and
>sending them to the upstream maintainer, these commits should be visible
>in the linux-next.
>
>I have occasionally asked sub-maintainers to add their trees to the
>linux-next, and sometimes this worked. In other cases it could not work
>for various reasons, e.g. workflow of the upstream maintainer or
>reluctance to share commits early. These reasons are what I would like
>to discuss and, hopefully, improve.
>
>
>Why is that a problem?
>======================
>Patch was reviewed on the list day X and applied by the sub-maintainer.
>Then for two, three or four weeks, this patch is not being in the
>linux-next means:
>1. Limited or no build bot coverage.
>
>2. No actual integration testing, even if it is just spotting early
>merge conflicts.
>
>3. No wide community testing.
>
>4. Contributors cannot base their patchsets on linux-next for
>convenience, but need to find each sub-maintainer tree and pull it. For
>few cases (see further) these sub-maintainer trees are not documented in
>MAINTAINERS, so it is impossible for contributor to rebase on current
>maintainer's tree!

This topic seems to come up on an annual basis :)

As a follow up to last year's discussion[1] I wrote a bot[2] that is able to
analyze pull requests and respond with statistics about how long commits spent
in -next as well as on the mailing lists. An example of the reports it produces
is available here[3].

I haven't ended up receiving signal from Linus that it's useful and not a waste
of his time, so I stopped sending these mails out.



[1] https://lore.kernel.org/all/ZyAUO0b3z_f_kVnj@sashalap/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/sashal/next-analysis.git/
[3] https://lore.kernel.org/all/Zxf3vp82MfPTWNLx@sashalap/

-- 
Thanks,
Sasha

