Return-Path: <ksummit+bounces-2139-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2830FB22CCC
	for <lists@lfdr.de>; Tue, 12 Aug 2025 18:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ACB9561272
	for <lists@lfdr.de>; Tue, 12 Aug 2025 16:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B15B2F8BD8;
	Tue, 12 Aug 2025 15:55:49 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E622F83C7
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 15:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755014149; cv=none; b=fWboM4yUVMusjDSWKQCmrQq4JEhoeXEAQZ3vpzz2C/B2DsVSa15pNoJwgdee0UoJeQX9Xiy9UeXz8e+yNmoU0DxSmeibmbaJsnwTLcVf4Gejz357f9qWpheW22frGnfqnrp/AVqCCymjbgE5Bo/BhNnOrtKAE9qIxgbczwdC904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755014149; c=relaxed/simple;
	bh=iwc1BNoShOIUZWZqi3gu01s0rRYtmi1WPzKZ+ERFJvk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yv+gt85P42Buwk5d4OwrmhQDst6p5OjZCjAcwY8kFT0wF2kKUXw/TWQO3FLR/ydSFUQvsJiA+xmHKLezdxuI9y55nMb6TgOZykb+l1aA8qo46h+zbg5Ympr3NRPZD0U3ahLgiXsMXui+ixLqx1t3SHhvzUXvWCxP7OrAQ9YpKiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id F3A22B86F5;
	Tue, 12 Aug 2025 15:46:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 0516F20025;
	Tue, 12 Aug 2025 15:46:15 +0000 (UTC)
Date: Tue, 12 Aug 2025 11:47:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Luck, Tony" <tony.luck@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <20250812114701.5540e038@gandalf.local.home>
In-Reply-To: <042b0357-3d0f-4451-85f3-631753343a8a@paulmck-laptop>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
	<aJJEgVFXg4PRODEA@lappy>
	<12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
	<f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
	<aJpnStlxDUsGNPuA@agluck-desk3>
	<cad0806b-3a87-4630-b19a-bbe8d9db1701@paulmck-laptop>
	<87o6slbhap.fsf@trenco.lwn.net>
	<042b0357-3d0f-4451-85f3-631753343a8a@paulmck-laptop>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ybcwi4qzq8bwmmctummkcs8sw7fe5hub
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 0516F20025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+Mlrnj5qLL1bj6Yo4TmchJIxI518uA6qk=
X-HE-Tag: 1755013575-966842
X-HE-Meta: U2FsdGVkX18kECCfoER5AuxQ/2beK2jb4m3U3sKvLJcXuIyLs0GeTzulWxhrozoey+/3ZJVBeJNyGVTOd1Qjcr6yB7ctaqyW3YKd5gU/dboYoaEHjhByfMu1XnXT5WLlC3xx0hL8rdvBtq7WaJ3wxBZZa29FmjTz01JXFS0sqre5+iizxKXubZy3qWQzAA73cB79m5m7EYNvnllN7uD9SuUmy0rebWriMSuaglXwkMQuLXtW4qfZ8FfN/wKej4A9nBCfEbcmTzTS3GA2DgWjYhr0SxF3indq2hZIsex9mf+cMEAVnUCSxGasnEfCLc/WphYfbA5QF6LIWdpNrT6/YilFcCO/wtCI

On Mon, 11 Aug 2025 16:03:34 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> At the same time, I freely confess that I am not yet seeing an option
> that brings us much joy, at least for values of "joy" that include actual
> incorporation of AI/ML source-code output into the Linux kernel.

I guess it will only bring AJ (Artificial Joy) :-p

-- Steve

