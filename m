Return-Path: <ksummit+bounces-1745-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866BFA3D898
	for <lists@lfdr.de>; Thu, 20 Feb 2025 12:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE7233B08D2
	for <lists@lfdr.de>; Thu, 20 Feb 2025 11:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8091F3D5D;
	Thu, 20 Feb 2025 11:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b="CIjUyMZw"
Received: from sender4-pp-o94.zoho.com (sender4-pp-o94.zoho.com [136.143.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC861F3D50
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 11:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050779; cv=pass; b=eQKxezK8b8w5UxdJyFOFt5dxPg3x92ZXmIVAu5cCVpcddiYfbsJ1kivivEvHSntDE+gh9CEKzjkVOWIYbWM8yyy0007j8UPRSgwY1mZvaQz9cT+Wdt1xHSF/baaXBLbsoeV8SiqwzcSRIrr1qBh+hY/SR/01TZ0Bj68lnGtxJOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050779; c=relaxed/simple;
	bh=UcTySv7yRgTK+Er4uEWu3DshPkzc+A+pII3v5N4La2w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UiIrAWai1jYfta2xT53oIhvgC9S0sywsOJZKuAy1dgrTo9bFE99OnH7InwKBmxkR6KHjBB06sgqW52rXxW1aA6kjztN6GIT4JJA6ICDTcrOoW8U1e9HVBonW0tJZKd39TjAqttjAjm64gzdURcfloWzvWe3YMTJOVv84yQ7xa4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=safinaskar@zohomail.com header.b=CIjUyMZw; arc=pass smtp.client-ip=136.143.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1740050775; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T7xFPqBdoxerqbeMe1yzwjWAGpS+Y5w3CEiczOwVyLoYvPwp4SVRVeBC3D6GYbRpx8hm1sjZ6w9gEts1D06pmqWptIiPSroa5P80eXQXNuU2FLz8JrquoA8clKE2cMUEQ6/UUTT2ycrNILqKYadOnbLfpBLe7TpnG0vXIgMeEL0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740050775; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UcTySv7yRgTK+Er4uEWu3DshPkzc+A+pII3v5N4La2w=; 
	b=WJFDDw4bPYahOQY5nXA4LuqQ714yQfMJIYio7pB4YM7Bic88oONVF0hkJnbhhoXWfeVM6ISyIHdZBMnFeIbc1MN1xDdRd99fkeDUWZ7AGvneYVlaLncEnAk9HENVrpfh9xhyWzypfK9CL0knpRZ/sBjCXpSYxrS2VLL2HTaMccs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740050775;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
	bh=UcTySv7yRgTK+Er4uEWu3DshPkzc+A+pII3v5N4La2w=;
	b=CIjUyMZwgejveaRMbS0/DDfMwI7BJ1/pB+oBMgRefs3Z9M7gOij/96HnvwovwlAD
	1uWW7CQA4X2IlwfJRTqRsZjGndQqiuRc7E74Ku7gG1b22fdRbfW80U4qwTqoya6Ezv2
	sLJIH9i/4t87o835FLCHtTmu2FJk7OtnxEiX3etk=
Received: by mx.zohomail.com with SMTPS id 1740050773492288.7099199553145;
	Thu, 20 Feb 2025 03:26:13 -0800 (PST)
From: Askar Safin <safinaskar@zohomail.com>
To: hpa@zytor.com
Cc: airlied@gmail.com,
	gregkh@linuxfoundation.org,
	hch@infradead.org,
	ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org,
	torvalds@linux-foundation.org
Subject: Re: Rust kernel policy
Date: Thu, 20 Feb 2025 14:26:08 +0300
Message-Id: <20250220112608.38689-1-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
References: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr080112275422e61a1a58357afe378aac00003d1164aa230fcf63c5871fcd730d1108f86aecec240cbf592f:zu0801122769cb5feecf658d2ef00c864b00004d7be2ff8ee73349425b32e13002307bc2df5bdb4888642d74:rf0801122d971e074fe3376032099687aa0000f4264f89751fa38743803f9dabb168aa10d602f5ff2d2ecb3ea9d4111f90b8:ZohoMail
X-ZohoMailClient: External

> As far as I understand, Rust-style memory safety is being worked on for C++

Yes, there is PoC called "Safe C++" [1]. And it is already implemented in Circle C++ compiler.
You can see at the link how Safe C++ looks like. But it seems that this proposal will not be
accepted to standard, so if we choose this path, our code will not be written in standard C++.

As you can see, Safe C++ is much different from normal C or C++. So if we choose Safe C++, whole
kernel should be rewritten. (But I personally will totally love if some company spends billions of
dollars for such rewritting.)

[1]: https://safecpp.org/draft.html

