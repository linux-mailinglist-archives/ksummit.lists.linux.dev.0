Return-Path: <ksummit+bounces-2679-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3241ACD307F
	for <lists@lfdr.de>; Sat, 20 Dec 2025 15:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1DFC301A19F
	for <lists@lfdr.de>; Sat, 20 Dec 2025 14:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53137226CF6;
	Sat, 20 Dec 2025 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fk2jHFgr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD731F94A;
	Sat, 20 Dec 2025 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239384; cv=none; b=X54IK6qAaJFo1UwiYNIeu56Q7oLVZKWuz6I8su3X4CMavVDqqJMaFnyiAxnbi4N6FBKy8wJVronvu57iM61+LihP2HixrX4cg1YBjfm2m3nwXWNeVGa0xHKTyttgRyU2jIWiWNBRIJokCwbB0ftHemUkh0QWO+6ygD+KKI2pIiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239384; c=relaxed/simple;
	bh=PM0ZbT0o0CcIEi6LFyUNSm9urCEVVuT+nA0AtU0Ml4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M/wsBzQ6KiDOpMRnmaJXzPeu27cBcf36IpePtvB424w9RE9+6gaPNWfiZcXc2QHSOBDaTTq0yN5ilyE0w7OmbKBLauJfeStQ2BjHREE3/D4cU8d9B1NiSiMPxJt8pHD8YwykL8njtOFJuLOa3KbbdGE+tyaH8Mk87Nv2HeGjDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fk2jHFgr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A706C4CEF5;
	Sat, 20 Dec 2025 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766239384;
	bh=PM0ZbT0o0CcIEi6LFyUNSm9urCEVVuT+nA0AtU0Ml4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fk2jHFgriXRYEVEYX4+MpMOCcAMoKwOea/2DBbE/NgPsvDu3c0Gv7llFXkHdLOkfF
	 IPB5mpctwFjJj4IOw0tXY/Fi2PCh/GyDZM7GHc2G1yMF+58qm20kTg6NTLCwhT3qJ1
	 ccmTpmYTFSTIp3UhJq5BwZFzpOjM+dJ/wZai/t1FK9bmMohTychxAvfoCOnrR4CkVe
	 RvCswZb9HeGNeKMGc1GfsFiloFeXVIkerLD661PuuIzG8+ZZUffFvN8k82oOUzLfUi
	 yaKniIfq5tX5hu/+F5v4G/b0IUh5gAmVRuFtGO25r+oZaeDwdQWgPHFob7ZSbf0Oeb
	 S1q0/PUDSHetg==
From: Miguel Ojeda <ojeda@kernel.org>
To: ojeda@kernel.org
Cc: ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tab-elections@lists.linux.dev,
	tech-board-discuss@lists.linux.dev
Subject: 2025 LF Technical Advisory Board election - voting reminder
Date: Sat, 20 Dec 2025 15:02:05 +0100
Message-ID: <20251220140205.43515-1-ojeda@kernel.org>
In-Reply-To: <20251214032716.12886-1-ojeda@kernel.org>
References: <20251214032716.12886-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One last reminder that voting for members of the Linux Foundation
Technical Advisory Board is open; it will end after December 20 AoE
(Anywhere on Earth).

I'll post the results shortly thereafter, and then I'll stop spamming
you all about this -- honest.

If you have not yet voted, you still have a bit more time to get it
done.

Thanks!

Cheers,
Miguel

