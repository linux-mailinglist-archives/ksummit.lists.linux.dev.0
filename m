Return-Path: <ksummit+bounces-2612-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9CC60A55
	for <lists@lfdr.de>; Sat, 15 Nov 2025 20:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35DD13A438D
	for <lists@lfdr.de>; Sat, 15 Nov 2025 19:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB0230595F;
	Sat, 15 Nov 2025 19:07:57 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87F1DB54C
	for <ksummit@lists.linux.dev>; Sat, 15 Nov 2025 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763233676; cv=none; b=arv4yNBlsJjc3QnJr7Cu6E3ZazM8aShbtmhegnNWHU3pNuxn0wHAOt8IYqLt91I77KLuOBpVSDSVYTIzS57SSz+8YcCasJ/J9Fzpi1SXNPmQg2CqGBKDJF9s58dYX8qxJBUWI1aL9bxmRS6x2XoBHxJNV/qDAt53i69Iv/TL8ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763233676; c=relaxed/simple;
	bh=NEQS1BcQOEP6SGYugbJEGTno6lnZvUDvu5EJzs7AoME=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITWWNGVwnD5oSKLYNFfqJoDteTGkDPg9Yjy182qTS+ccgckSeDbcvIk8l0CrsPOSTROsh9JzTrjjCNHj2Qdl0+41cV3wSuxLJ0PXEW4CazVgaaflwUN+7psWe1ZUkWn3ATFNHQLM2EpmuR+uK4MYzBGhqgC9wEccb4CPl1AIpic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 421141607C2;
	Sat, 15 Nov 2025 19:07:47 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 011F52002C;
	Sat, 15 Nov 2025 19:07:43 +0000 (UTC)
Date: Sat, 15 Nov 2025 14:07:46 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, dave@sr71.net, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, NeilBrown
 <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dan
 Williams <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>, Sasha
 Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil
 Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20251115140746.6a3acfd5@batman.local.home>
In-Reply-To: <20251115140556.44aac254@batman.local.home>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
	<87qztz9v88.ffs@tglx>
	<20251115140556.44aac254@batman.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 011F52002C
X-Stat-Signature: cir6are4izime1mg3pfzc3rgndf4m388
X-Rspamd-Server: rspamout06
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+uLVHg38Jzei04AI/A19wA2RxXh5DMhQk=
X-HE-Tag: 1763233663-633822
X-HE-Meta: U2FsdGVkX19q9QEM7VkGKFXYY2VvraY5Sp0MTYgToHZe0d9WS4jUnzo2eXMb49Qy4tJiJljuR8NiQZn7paYnb4k6MWvuu7hbZaA21Ot9BmC7unNPbYeOPXUA4fQV28h0lmP3tKeTt/lsN3W+Sk6AC32sNMNx/p98xmTO3ZTT2NP8QAB6iEN/1MpB4V7nfR5Gg1zjY7UY3noc+Q2uk9PeByWj7bb8cnh4mIsq3KZGjRqAEHt41DNlKKifWpPSXCag9veocSkukIs0MRvJuocaGDoZy1fB71plYH1frVi//8W/P5Ow1e7NIP1iwgD/3jI6ygdVhm/UkBJ8F6tEnMwArTlqdGeUvY/uL2W+mlskveF0iCnJxAdlxPJ9GuBhImrE

On Sat, 15 Nov 2025 14:05:56 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> As Dave responded to Luis, although that is a good idea, it's out of
> scope for this document (for now).

I should have said it's out of scope for this patch, not document. The
point is that what tag to use for this is a separate discussion.

-- Steve

