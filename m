Return-Path: <ksummit+bounces-2387-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B04B56394
	for <lists@lfdr.de>; Sun, 14 Sep 2025 00:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16AA8188D5B1
	for <lists@lfdr.de>; Sat, 13 Sep 2025 22:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D702BE642;
	Sat, 13 Sep 2025 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kU0Erbzp"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839002BE058
	for <ksummit@lists.linux.dev>; Sat, 13 Sep 2025 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757801990; cv=none; b=uP3sny5k49veij3+6LtWmd9OaAFZu8MbN8ZozIBrioWI6frwtXeoDPQCHROTQVhPeE6JYPRPwjlat0IVkrWse2ZI3i7w1sRqn9sO54aYX/7z6jSZWfmt0mqxxQcPSdjYuKSnc3uA+YvBgNgMh9cWieoGIWnzHZ+AUFNchcmjMyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757801990; c=relaxed/simple;
	bh=Tu1pEO+CraEr9kwlmHbKdUqd/eB42HXdXhxWsQfjpp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dzBVmjX37vgAo1V+dt1OQpMmuvfsM6lqUYMo/cCBPfrfkwl6KYJSwd/1t7Sh7dyJ4/rN8yEsPMWpf87DrqrNALaqMESOBhpGfvq8gEP+3ifaJaMrlBEDrYlyzAtGbscP29Fxwgwlh2o2ukJaEqEPFKQMzgWbqiyvFInWeAEMskU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kU0Erbzp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03C4C4CEEB;
	Sat, 13 Sep 2025 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757801990;
	bh=Tu1pEO+CraEr9kwlmHbKdUqd/eB42HXdXhxWsQfjpp0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kU0ErbzpEuQa2/kv3PjkJWRhw+sLs5WMDMDIZPNIYwbcxDGOB1+kfQNYJY6xqOg4E
	 fhd395IXkeLs2My3Tdmyih43twY5xzLMMkPyp4uZqm1YDugRe+WEjjt4l9t4l04V88
	 LE/ThEV01OteqRtT5wM6NAohpbef90SV820Aby03RP2eFEJaR2qJa4PyaSzijx3+l/
	 fLqSF5VH+OBjqRWlQGPuD925GiWhmMaAEuCfzZ/JwikqvoXHM1dLg8s8rKbEdKqPuD
	 tkOoitA5CKOh7DKWLUvLechbAy2kBtnUwrOByo0OszghjKwDQ+dQo8njxVXzfWAA75
	 H7lPqJ7NmeVZg==
Date: Sun, 14 Sep 2025 00:19:47 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Revocable: a mechanism for preventing "classic"
 use-after-free bugs
In-Reply-To: <aMWEhqia_jpl12uI@tzungbi-laptop>
Message-ID: <9q6poo2r-9589-45n8-037n-q75348021s34@xreary.bet>
References: <aMWEhqia_jpl12uI@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Sep 2025, Tzung-Bi Shih wrote:

> Abstract
> 
> A "classic" Use-After-Free (UAF) can occur when resources tied to
> hot-pluggable devices are accessed after the device has been removed.  For
> example, an open file descriptor may hold references to such resources; if
> the device is unplugged, subsequent file operations on that descriptor can
> trigger an UAF.  This talk, a follow-up to a previous presentation[1],
> explores an approach to this challenge.
> 
> We will present "revocable"[2], a new kernel mechanism for resource
> management.  A revocable allows a resource provider (e.g., a device driver)
> to invalidate access to a resource from a consumer (e.g., a character device)
> when the underlying device is no longer available.  Once a resource is
> revoked, any further attempts to use it will fail gracefully, thus preventing
> the UAF.
> 
> We will discuss the design and implementation of the revocable mechanism and
> its application in the ChromeOS Embedded Controller drivers to fix a
> real-world UAF bug.  We hope to also start a discussion on how this generic
> mechanism could be adopted by other drivers to handle similar resource
> lifecycle issues.
> 
> [1] https://lpc.events/event/17/contributions/1627/
> [2] https://lore.kernel.org/chrome-platform/20250820081645.847919-1-tzungbi@kernel.org/T/#u

I will be honest and admit that I haven't looked at the linked resources 
yet in a big enough detail, but judging purely from the abstract above, I 
believe this will immediately met by "how is this different from 
device-managed (devm_*) resources?", so hinting about that in abstract 
already might be helpful.

Thanks,

-- 
Jiri Kosina
SUSE Labs


