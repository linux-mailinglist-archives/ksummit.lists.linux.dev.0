Return-Path: <ksummit+bounces-2301-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E3CB49083
	for <lists@lfdr.de>; Mon,  8 Sep 2025 15:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F8D3A6798
	for <lists@lfdr.de>; Mon,  8 Sep 2025 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3E930BB83;
	Mon,  8 Sep 2025 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="yNmGcwon"
Received: from sg-1-35.ptr.blmpb.com (sg-1-35.ptr.blmpb.com [118.26.132.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3689D302CC2
	for <ksummit@lists.linux.dev>; Mon,  8 Sep 2025 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757339851; cv=none; b=G6FFScyHk/57FuIywzynbkv7PwqtT9Vxst0gJ7b7sj2r0iD/aIto+XDYLmvddZZc2wkxlQYamFGfw3Q4mwO2QSRL63uMcMnYMQa1VJZt9+S/hcaKDZrxICbaEIAnX/idUJb04ZOtBwsB9W1R0VEZs6LrooiaUjxXfwDzEEG2+x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757339851; c=relaxed/simple;
	bh=EgEvxOyH/qrHCxKj/D4pUiK0ZgPl+2vp1WELoJroahQ=;
	h=From:Subject:Date:Mime-Version:Content-Type:To:Message-Id; b=UrjhNT3E5GVZP353tOvROjcDA55oVm0Cb/Ai4AqTJg/p0DnGcEOVCMvD4WJFzMduoR3B63Lw2SLuQ9n2GAqz+dorK3dXa3oPF5M+sxPv0MZgFK/2hNw3cy4ipUV/Z/jPh1+T4Cwy+Mk0ZbmLTiA51C2WrM7uOovWwY97FuDZkhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=fail smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=yNmGcwon; arc=none smtp.client-ip=118.26.132.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fnnas.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1757339836;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=EgEvxOyH/qrHCxKj/D4pUiK0ZgPl+2vp1WELoJroahQ=;
 b=yNmGcwonWvCAeB0l4CfVy2rYv0tV/kpk/FcF8A5Sp/flPCQC3ju5H8/NAa5RKwJyfjFqLp
 f+LdwjCXt+TdmHIPT4o99uq3ch3hHkzLxvqyRxyjYWEAna+iG7G0Mr5py8nsqDjDHeIteT
 bZd553vhc/tcKvJRTG1/UE7gXthpd16m9gkpqXMKEqD8mpTcQaOYJLpzd794EKcAjmsXWt
 vdyyXySC+GtpMR0akWUjYYhETJoG44YUXzWQ/KGng0x4uup0c98EuHNY5pIwbCkeOWCcQs
 LV1wAgaFSmNgikYMaO7W2yQCtDGYFrVz6xyqu7Qkjk4ikHMVGJ3YbNgmrCSwbA==
X-Original-From: Coly Li <colyli@fnnas.com>
X-Mailer: Apple Mail (2.3826.700.81)
From: "Coly Li" <colyli@fnnas.com>
Subject: [TECH TOPIC] Re-think of richACLs in AI/LLM era
Date: Mon, 8 Sep 2025 21:57:03 +0800
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
To: <ksummit@lists.linux.dev>
Message-Id: <562D078C-187A-4784-A18D-EE07622977B9@fnnas.com>
X-Lms-Return-Path: <lba+268bee0bb+901d41+lists.linux.dev+colyli@fnnas.com>
Received: from smtpclient.apple ([120.245.64.195]) by smtp.feishu.cn with ESMTPS; Mon, 08 Sep 2025 21:57:14 +0800

[Resend proposal for Kernel Summit]

Hi folks,

This is Coly Li. I=E2=80=99ve been maintaining bcache for a while and have =
met Linus,
Greg, Ted, and other maintainers in person at many conferences. Yes, I am a
sustained and reliable kernel developer.

Recently, I joined a startup (https://fnnas.com) that provides AI/LLM
capabilities for personal or micro-enterprise storage. We help users share =
and
communicate AI/LLM-processed information from their stored data more
conveniently.

Our users can run highly compact LLMs on their own normal and inexpensive
hardware to process photos, videos, and documents using AI. Of course, it=
=E2=80=99s slow
but that=E2=80=99s expected and acceptable. They can even come back to chec=
k the results
weeks later.

In our use case, different people or roles store their personal and sensiti=
ve
data in the same storage pool, with different access controls granted to AI=
/LLM
processing tasks. When they share specific information or data with others
within the same machine or over the internet, the access control hierarchy =
or
rules become highly complicated and impossible to handle with POSIX ACLs.

We tried bypassing access control to user space, which worked well except f=
or
scalability and performance:
- As the number and size of files increase, storing all access control rule=
s in
 user space memory doesn=E2=80=99t scale=E2=80=94especially on normal machi=
nes without huge
 memory resources.
- For some hot data sets (a group of files and directories), checking acces=
s
 control rules in user space and hooking back to the kernel is highly
 inefficient.

Therefore, the RichACL project comes back to mind. Of course, RichACL alone
isn=E2=80=99t enough. A high-level policy agent (in user space) is still ne=
eded for
task/session-oriented access and sharing policy control, but RichACL can he=
lp
implement file system-level access control. This would give us a context-aw=
are
and highly efficient access control implementation.

What I=E2=80=99d like to discuss is:
- After almost 10 years, should we reconsider RichACL in the AI/LLM era?
- What are the major barriers or remaining work needed to get RichACLs into
 upstream?

Since our first public beta was released 13 months ago, we now have over on=
e-
million active installations running daily. This is a real workload for Ric=
hACL
and represents real feature demand from end users. If you=E2=80=99re intere=
sted in this
topic, we=E2=80=99d be happy to provide more details about the access contr=
ol
requirements in AI workloads and even show a live demo of the use case.

Thanks in advance.

Coly Li

