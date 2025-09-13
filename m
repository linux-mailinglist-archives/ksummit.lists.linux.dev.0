Return-Path: <ksummit+bounces-2385-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F60B561A3
	for <lists@lfdr.de>; Sat, 13 Sep 2025 16:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F5D56641B
	for <lists@lfdr.de>; Sat, 13 Sep 2025 14:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A1D2EF664;
	Sat, 13 Sep 2025 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hmVB/p/E"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F27E1DDC23
	for <ksummit@lists.linux.dev>; Sat, 13 Sep 2025 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757774986; cv=none; b=GY39+pgyM0zzjEllBTnzkS3PCyWLkA7FveF79ViE9Wk/8xKluGX82DWgXf7i6HeoVRkKjIY0T18DUQTfyPKGyvQi3Y2HRgkYjiTp7v1gHBtlE7fuwKqWFguOkMcnmyTZjzdrYqv4F3guE5TZBzc1puBoFXuwBJYb+L2oWxQJVA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757774986; c=relaxed/simple;
	bh=+7z23RziMOwQGD+MTHRpsIIvwCu21Bhfz/x0dvMm5mI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeItio+ZdmXvVHhPEAh6E2+ORN8ueQV7z5qSyxnndok5ehXfEw6a8BmP2BlvdrVCW7RHKalkhNe42R1kiZA1AqI5Uwhr727OxNj6QDqvBIKkifXelrYen1bOv4+q1gxsoSfDbWp8Hwg6nJY+QbF6VvwdEJKT2P8nQgODfUERaII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hmVB/p/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6FCC4CEF5;
	Sat, 13 Sep 2025 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757774985;
	bh=+7z23RziMOwQGD+MTHRpsIIvwCu21Bhfz/x0dvMm5mI=;
	h=Date:From:To:Cc:Subject:From;
	b=hmVB/p/E4NUr099TyFphitwyXh0wA/Q6mTDVFgnUK5Dx6wsxUd8hhT5dkyF8Jdk2Z
	 wmE2cL4ETqylG+IZhWh2WBwKGYuF3YmPYrPuwvnR91HFqTR8FBdbjpRDy9YOD/e3FH
	 uEIj/Tx1CJlED5cR85SXb21oDI7MxXKQaID00byl+Iks6YZYKXHtfJ385D2EC/An4U
	 9NeJy+NWtfbUggNnax22Y5bKrQnOLyHxATK8ZAW8QL3sp4GGfHEZ0GSCOcG2hgKe9r
	 RWgvE0WlJdzY0JQ7rXbL4HcX+o5JM6yaiKgNDgEEL5hkm2UbwET472r0Hbmf7eOSHE
	 0t+aAJkGoUBXQ==
Date: Sat, 13 Sep 2025 22:49:42 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: ksummit@lists.linux.dev
Cc: tzungbi@kernel.org
Subject: [TECH TOPIC] Revocable: a mechanism for preventing "classic"
 use-after-free bugs
Message-ID: <aMWEhqia_jpl12uI@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Abstract

A "classic" Use-After-Free (UAF) can occur when resources tied to
hot-pluggable devices are accessed after the device has been removed.  For
example, an open file descriptor may hold references to such resources; if
the device is unplugged, subsequent file operations on that descriptor can
trigger an UAF.  This talk, a follow-up to a previous presentation[1],
explores an approach to this challenge.

We will present "revocable"[2], a new kernel mechanism for resource
management.  A revocable allows a resource provider (e.g., a device driver)
to invalidate access to a resource from a consumer (e.g., a character device)
when the underlying device is no longer available.  Once a resource is
revoked, any further attempts to use it will fail gracefully, thus preventing
the UAF.

We will discuss the design and implementation of the revocable mechanism and
its application in the ChromeOS Embedded Controller drivers to fix a
real-world UAF bug.  We hope to also start a discussion on how this generic
mechanism could be adopted by other drivers to handle similar resource
lifecycle issues.

[1] https://lpc.events/event/17/contributions/1627/
[2] https://lore.kernel.org/chrome-platform/20250820081645.847919-1-tzungbi@kernel.org/T/#u

---

I just discovered the Kernel Summit topic suggestion is a two-step process,
and I only completed the first step (the website submission), missing the
second.

