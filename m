Return-Path: <ksummit+bounces-1216-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7AF8FBE7A
	for <lists@lfdr.de>; Wed,  5 Jun 2024 00:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27A8C1C24FA6
	for <lists@lfdr.de>; Tue,  4 Jun 2024 22:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB577132135;
	Tue,  4 Jun 2024 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVUK+U8r"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BD1DDCD
	for <ksummit@lists.linux.dev>; Tue,  4 Jun 2024 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717538629; cv=none; b=ltYEP0eTqBiDKuFIlM7nJ4GCh75q2SAmuQmR8+J4Usd0DMKKKKjqFoaNhB3YXIWYoymeTPPgXN58k+biLM3eT32zjk3xYdbVHSK9OJPqyjugTa3VfW6GIN9X2WN5AjWZ3zJHVqCe0F1Sp7lZ6zZ2ICt/c1ew6lVjNVwrIyrmDhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717538629; c=relaxed/simple;
	bh=IiaRcE2Zr7F3mCh35E8eqTHFlE/uZoPHgwEjvOCPYwI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=A6tCIFxzMnF7q6E246BDdM0T9uoDef4yxJumxyAhTuonN6cP5rwWYkiNSxGyzECp/slAYcluRHuY2glIq7SgzoT2z9Kx+cf/4q+Tl6K0u0MNwzRcllR+sZrmpJDtCPZLZI0LkakDO0W7/e6STYuvzb0bWDz8YExYKt9iJKgeSw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVUK+U8r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2CAC2BBFC
	for <ksummit@lists.linux.dev>; Tue,  4 Jun 2024 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717538629;
	bh=IiaRcE2Zr7F3mCh35E8eqTHFlE/uZoPHgwEjvOCPYwI=;
	h=Date:From:To:Subject:From;
	b=oVUK+U8ri7b4ML61i3lVrwSD+XrvUbnMvWO0U82JDHBgc1tQRuNz2V3JInErdw202
	 VUWmnZNPubjUhDyoguVF/VXki+1U4W186oesAvEB7MNJ74tjhpEGjHDQ3317igjVGq
	 frFasm8aDaM2g94MGr7vhTsaIlE3iPF6H0LY8jcUUU/wCEyUYU5L3QejVl6+hvyYyd
	 H/3tGVNxLPKHgbZ7rNZAwf5hfCOsspn5wORUH8W1YiHZE65WeaWD4KLH80w1S6ZteS
	 PTqerqyEw3AVqiB9py+PfVVOmcGO+5OCtCbkx2Xs/RXfqyey0qqUvst8wohummVDNU
	 ifHRcVNRSvf0w==
Date: Wed, 5 Jun 2024 00:03:45 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: ksummit@lists.linux.dev
Subject: [MAINTAINERS SUMMIT] Merge tree too flat?
Message-ID: <nycvar.YFH.7.76.2406041151590.24940@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On last year's maintainer summit, there was a session where Linus asked 
the participants to bring up topics / questions [1].

I myself was the one raising the concern of the merge tree feeling a 
little bit too flat, and there seemed to be general agreement on that.

Checking the git repository as of now, it seems like we have not changed 
anything in that respect over the past year, and a lot of things are going 
directly to Linus although they could be cascaded a little bit better, 
contributing to better load-balancing on all maintainer levels (including 
the top-level one, of course).

I'd like to propose this as a proper discussion topic slot this year, by 
e.g. looking at:

- the actual numbers and current merge graph

- is this really something that could improve maintainer load (on all 
  levels) and throughput if done properly?

- how could we motivate maintainers to change the process and delegate 
  more into proper hierarchical sub-trees?

- potentially identify particular trees and changes that could be made in
  the merge graph/path to improve the process

[1] https://lwn.net/Articles/952146/

-- 
Jiri Kosina
SUSE Labs


