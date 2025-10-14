Return-Path: <ksummit+bounces-2527-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C41BDB12C
	for <lists@lfdr.de>; Tue, 14 Oct 2025 21:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BCFB4EAC09
	for <lists@lfdr.de>; Tue, 14 Oct 2025 19:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D997B2BE650;
	Tue, 14 Oct 2025 19:35:28 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036512BE051
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 19:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760470528; cv=none; b=TWvPpeJe29sq4STqLyzgpISrOAFs8ued1W0qmG7XJzARn1dEcMMv6Yq7SlUqmu/aff5vwypFEZR7c3VKBq+1fWnfjd/uhwK6tv0aKu2QV5K6Qf5A18XNAtDifvuMiRTspmrdrtqn5TBPZihD51HBWpdJGNRzGIFu6Lv90TiCnmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760470528; c=relaxed/simple;
	bh=nk2xc54Nv6gz4w+J/t6n+Z9hk+e68QQhIa5dKWQ5xuo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAhec4mx8A6XhMleztbIKHqELvYn+TwfB3UMctSwvoNs1s+ojkfZXLCKECXdyBKjLAsPilNQVDw8b9Ix9pHnG52H2QNID6eORqT+ymGW7KwPw4RZDURMnrZB+aeMLV9nCSze6u7ISO5LBNkXWUtINKDl6/ZkNoSVzCnDe0GDRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id B3C2C5C558;
	Tue, 14 Oct 2025 19:35:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 1599420027;
	Tue, 14 Oct 2025 19:35:16 +0000 (UTC)
Date: Tue, 14 Oct 2025 15:35:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, James Bottomley 
 <James.Bottomley@HansenPartnership.com>, "ksummit@lists.linux.dev" 
 <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251014153521.693907a1@gandalf.local.home>
In-Reply-To: <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	<6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
	<8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1599420027
X-Stat-Signature: y3fpi7987m98cptj7hjonas1ib4pbjby
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+/lOum55O8/1VZ9PTou79uGlLHVcP38yc=
X-HE-Tag: 1760470516-977200
X-HE-Meta: U2FsdGVkX1+UUmmDgg3wuKopDHh1umkznK3gGkCNyT6H3KSTHv/glZpumimh8OVGhmwCM/gtSGiPuzTW3OuRFBUGJwp1S4ERL1S81YFmTcDJDKt0VnzhBqGFZh60/laPpTJfU4LeV7XnxH+1gI2/Oy+uDnC11zJlHnYTTA/LLU9zQJIH88mBRxm+A9YfIqpoHBkzmRDK57pVr89Unt1S/YtLbsD3HpAP4uhaRXeXv4jmmAs0//xzaFEb6GbPCBiG9isT5i8Qc9QfkYKu/rpNnstgIxZQ+OQm+ttqq36beohmpkHn3TZwsDnOZP9dUMh9C2Ptb6Z6H0LcAEulG3WG4WPaduC/68TltPhzQHItxGGKa222Oq2/6pdlnG4GzOHu+Y0MzkaFAHRVtnx4bE3wcg==

On Tue, 14 Oct 2025 21:12:33 +0200
Johannes Berg <johannes@sipsolutions.net> wrote:

> And we're taking it away because literally *one* person thinks that it
> adds irrelevant noise.

Are you suggesting that we lost the "benevolent" in our "benevolent dictator"?

  ;-)

-- Steve

