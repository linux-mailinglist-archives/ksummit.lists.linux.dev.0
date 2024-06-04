Return-Path: <ksummit+bounces-1220-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAC28FBF15
	for <lists@lfdr.de>; Wed,  5 Jun 2024 00:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9517E1F21A1A
	for <lists@lfdr.de>; Tue,  4 Jun 2024 22:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B1114A4FF;
	Tue,  4 Jun 2024 22:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKiDmy4T"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8247218651
	for <ksummit@lists.linux.dev>; Tue,  4 Jun 2024 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540713; cv=none; b=tQzHYwqlPYZyZZgUHKOFAVxVHvI8YNNW4mnETwvEbbNRL7TxHwTVv/GFRvR7FNxtLgoc7K9eV/JwA9Aii/CxQDi8MLaV5LHtPeck4at017f0+WL/FUIFTdZFUQb7cAJqiPkEUpDS1RLwKlM1uQpbYfKGCXSPgQfOY4EthJ9IecY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540713; c=relaxed/simple;
	bh=eTVbJYNcRxBnM9BFsT5/89qCcpbZKgNIgzwjEfgN/dc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=T4vefRRG2LWEpvmzXFO0HWm+aumI9/S3sVgR3eYw+q7gro6XrXTVLVxbWrZs2Kh04uj87vhMWH9bVjKyD1n8Osgy7594PEr2zR2IT7s+8y2rYQnNnIEkRb6bnDoN+xvbQVZmHsi6ruVv747Dp4FP+zlIRGnZldeJRXlg9ZYsbP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKiDmy4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EE5C2BBFC;
	Tue,  4 Jun 2024 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717540712;
	bh=eTVbJYNcRxBnM9BFsT5/89qCcpbZKgNIgzwjEfgN/dc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LKiDmy4TtzP2y1FbCKfSD7jS6UhZhTsiT8yj6attJd4upYLhMoqoUUvWITYnG7UMb
	 ielGqYnJE6XH7IwvX8IpLlOvCP1fHs0dfC7H2NMtc3CnokuLuFyq+aPM9g6jE91SMb
	 9RFILgzwxom8pLSbIVn//n5W4VeHzud/ZvudFT0YEHZddDsT6Ic3EU2+H0gBP6FgiH
	 r4Ql6mDnhkxQhsyFSTyTCbIRiHNHJDu9EcDO0jxStVsxkLI5CoYVL5pEcgn20B8g5i
	 FIDdmFVdWbojuVE4PS54oQ/CnB3MfB9YpnafsQv6mRho/zJKuRqjE8qaIFWcHCMKvR
	 7qenNiYSvoCoA==
Date: Wed, 5 Jun 2024 00:38:28 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Sasha Levin <sashal@kernel.org>
cc: ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Merge tree too flat?
In-Reply-To: <Zl-WRpN0-rBVS7F-@sashalap>
Message-ID: <nycvar.YFH.7.76.2406050035100.24940@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm> <Zl-WRpN0-rBVS7F-@sashalap>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jun 2024, Sasha Levin wrote:

> I'm not sure we should be pushing for a more hierarchial tree. Yes, it's
> flat, but is it the issue we're trying to address?

That's one of the postulated questions :)

Distributing the merge load more evenly (by eliminating "hot spots" where 
a lot of merges are happening all the time) might help with the overload 
in some areas.

> I'd argue that what we want is more co-maintainer groups where several 
> folks share the burden. This, in turn, makes the tree look flat (all of 
> "x86" is one maintainer group, for example).

tip tree is a great example of this being implemented by a load of topic 
branches. Not much to be improved in that particular area, I'd say :)

Thanks,

-- 
Jiri Kosina
SUSE Labs


