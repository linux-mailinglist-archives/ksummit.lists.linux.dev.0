Return-Path: <ksummit+bounces-2397-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2CFB59C72
	for <lists@lfdr.de>; Tue, 16 Sep 2025 17:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E29227ABBFC
	for <lists@lfdr.de>; Tue, 16 Sep 2025 15:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8983469FF;
	Tue, 16 Sep 2025 15:48:26 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FD326F28C
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758037705; cv=none; b=uFhF9iCSF8n1pjZqh2OOaxwKNzxJhmW5WgbfDeVptRBNd2KsI34ucfXK149HvPu5lT2qgNFaAin4ezMlfuH7OTgF1yjBcWvGjGlw8xr9XVyExFmSXMnBbKVCXQrPmost60YuKFzmHKxEVZardusx6IUJtkDe4JmUzayna6WvAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758037705; c=relaxed/simple;
	bh=sxQIKXAwrH9juAqMLE86AqwN02/gexiy4uYWM/+6x9o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iI1TR0HRsv3/TCkLMEp1LHxUH3WwMkOw+eBtpoxco5cBDHPwzpJzFFtdg2hLL176+IHsGa9tE7EBhKPZ1HRxztjQa1ANoHZiRiAG/HXbztiUEdkxzrm6Me8KO0f87EndFIcZZHiaevQZsf2HlsNFwgySHv3dz4XRDeNZeYY/d50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id D699A840A1;
	Tue, 16 Sep 2025 15:48:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 373572002A;
	Tue, 16 Sep 2025 15:48:19 +0000 (UTC)
Date: Tue, 16 Sep 2025 11:48:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250916114820.45623213@batman.local.home>
In-Reply-To: <n3w52sm6d2gvbdhk34lamj52ihnspz5d2wgh4ojycr47rpvio5@ilamyahjnlmz>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<202509151019.CD7AA0C0BE@keescook>
	<20250916102022.5bc75a36@gandalf.local.home>
	<n3w52sm6d2gvbdhk34lamj52ihnspz5d2wgh4ojycr47rpvio5@ilamyahjnlmz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: b3cz7yw6p4uk7pucr3isqhp5oqk1kdue
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 373572002A
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/j7SBgV7LG1xPmF47jIIZRJ8dqVC3+Fns=
X-HE-Tag: 1758037699-981000
X-HE-Meta: U2FsdGVkX1/NPiu5IWOwp9B8krR0W8m3Zf7hMuBwi6wzOp8pKaqAhhy3x3DQZrsbBhw634HgsjLfOA6uJ7zBUXe0ATNb9APm0wVkzcBcRb7ZQgrXmDHuuaNzJL11nr+oROiZQ5ct6Kw92KLA2AbBQySnZKBB5fV0zC4CJzJqAkr8gHPORsWGMYbRVnGLfIre5/LxJh8v3CUZyAisOXLpkjipykFqYArnysk7AUdPRIeLKqf1L5e/7BOJ5DY15yOcnetfr9NtiDCgubkM5l8L/YAufKnzaeHhoRbXQ2XuEMMy13LRVR5MqDXzuVO+pcV3lT3z/xWNDIT8HHmwMYRzteOPY4ANuXOx

On Tue, 16 Sep 2025 17:00:37 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Agreed with the concept. Yet, asking AI to implement a quick sort routine
> which is widely documented on several textbooks - or some other very common
> algorithm with dozens of GPLv2 (and even public domain) code examples
> is probably fine. Now, if one asks AI to implement the very latest fancy
> sort algorithm from most recent published papers, then this is problematic.

Perhaps we need a way to say "Hey, AI, give me a sort routine that is
compatible with the GPLv2 license" and then hope that it actually gives
you that! ;-)

-- Steve

