Return-Path: <ksummit+bounces-1785-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2162A3EEB6
	for <lists@lfdr.de>; Fri, 21 Feb 2025 09:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7399B3AE4ED
	for <lists@lfdr.de>; Fri, 21 Feb 2025 08:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CB31FF1B1;
	Fri, 21 Feb 2025 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="YIkasxEF"
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFD81B0406
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 08:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740126731; cv=none; b=AWM79iGxNLXP+e4+OY/V+i6mCHkgpz3SmysdFR64TPYRDViNdGeZBkcK+dk//83Gf+Zl/+MBnm/wEm+GLLpRJ/jAWtDChpM4h59fAA2l1xUKdmfb2VbBsObb2Mp+6m2xxX//K1uitVqhz39KBL2Jcl7fiwvL/zVmqVatiT2gi5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740126731; c=relaxed/simple;
	bh=sOpoaaYi70tIuun+k4bCpzt72Cgn3AbfOmLUzsM8dlo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=cHbKj1+ouEpCSWN+GlTcgbldwu783QO5Nte6R9iDJnHUWZzs/1af+/dvyexESn870F1v65vbVympnoR/JL28axZHumdX2gfm/XiPSjQPnueUO/D9EsnXdDEXBFxuBwc3NXILcQP87vT5OZ1Ik7m5Th8eHr22ZyBE0q3OmvqaVuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=YIkasxEF; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1740126709;
	bh=sOpoaaYi70tIuun+k4bCpzt72Cgn3AbfOmLUzsM8dlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YIkasxEFJ+E5fwi17jzuVD+cyMYlf8CtSpI/3bzWmbC74HWOxYJq6USqlTuI6ajUM
	 ui1JqM3CvAPWXZ2DbxBsIgXY5ViErsekgguC2LfV/lwhm71jaDKV4mUYt5D+GBhMyA
	 7KTuIUnKdVmiPCaUOQqxdyEJVN7wSHFrngbMR3ms=
Received: from localhost.localdomain ([112.2.252.119])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 7DB05E70; Fri, 21 Feb 2025 16:31:27 +0800
X-QQ-mid: xmsmtpt1740126687tmzom3y51
Message-ID: <tencent_9877F4C8240A0DDA7399A0F8E2EEE71E5D0A@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0Clb7vetySGil+QBrDiZ9UDLfyhWTRdv38s6p/9DZL03cObi+ps0
	 TDR4+jSOSddH6EeX/N6vw14iDreotcGMJncR7grnxz/hhvQOKO6DGoisUr99ENwKtkMq6bVEwO+9
	 0uY/E7wKnrK32VyqrtrPxok7fYlBE/+BxKTGssd9dAi3uAIWJcctxirSauwGkB3rdbCGu0gNMQiv
	 7Na68RqwSaq6hsa7jrt3KroV8gl5Q6CX904QZ6axfUOQ5YJ0Hg2UcB153paY0LLRkk75Cc4EEQJ/
	 Qx5Ro0hM9z8Fj76T8v5mf1GSYBRxAfTDat5+PRjstW/fljah10yRD/Lb4phn1CfnnggFKlRs7lzg
	 Nf471kOdeMeUgSTFc/6X4/+Hun9lWe76DaBX4XL1UMqT+z6MHQyCowz2WZSv6IZ63FITCVZtgqRG
	 wsu7JtBfN4/PxcEwPk2xlSzMqZ90sHgEFbaWA6lJ2Hd8/CqB6rVv7MgpoCwG3uewLaRmkINK6Oj0
	 4Ytr4N9ss3UKUB4kABWjtsvYGc0mdME+rbqJcOvOfKXsgaTI02zWImp5f6r/hy4XzyjBHYXgZtSi
	 31HhRDDE+4rRDpYhEMO45eQ7tj/bkZPtOIhtWcOdrc7uV0kbJIgQLyJ21/+hME7fwEvG7YAOXa9V
	 bxjyioJGGeum0EURXYldvF6t867LkxzMXU1LD6j620wJOpgsj14vQb6a7ysTWlNJukFSq+YJuOni
	 nrLo8Hj46sBXMsQLzkkVF3eYE/T/Qbee1T44fsoe/zPdHp2w0LYBuQM+eAgKJmGimUdGoBEYlb07
	 cDnmadBraNUxaS/wmmb2Kkd1Y2HUGn6VwJcMRqqZoRJzSaiwbL2hig0j4ooj4HALPbl5YyOxHCUv
	 /RWgWJyU3JRbMdqc0Vg6q6LKRqs2VbNDgyTagdwCFfY1Gp68VqmJZaVcieaUQKHk7rwNWrll/tmN
	 l/yKSDWoA16sbnGqiRglgBnS067o4gG6AT7YKM2DOmfff1sibmYw==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: HUANG Zhaobin <huang_zhaobin@foxmail.com>
To: ej@inai.de
Cc: airlied@gmail.com,
	boqun.feng@gmail.com,
	gregkh@linuxfoundation.org,
	hch@infradead.org,
	hpa@zytor.com,
	ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org,
	torvalds@linux-foundation.org
Subject: Re: C aggregate passing (Rust kernel policy)
Date: Fri, 21 Feb 2025 16:31:27 +0800
X-OQ-MSGID: <20250221083127.54494-1-huang_zhaobin@foxmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
References: <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 20 Feb 2025 16:17:07 +0100 (CET), Jan Engelhardt <ej@inai.de> wrote:
>
> Returning aggregates in C++ is often implemented with a secret extra
> pointer argument passed to the function. The C backend does not
> perform that kind of transformation automatically. I surmise ABI reasons.

No, in both C and C++, fff accepts a secret extra pointer argument.

https://godbolt.org/z/13K9aEffe

For gcc, the difference is that `sb` is allocated then copied back in C,
while in C++ NRVO is applied so there is no extra allocation and copy.

Clang does NRVO for both C and C++ in this case, thus generating exactly
the same codes for them.

I have no idea why gcc doesn't do the same.


