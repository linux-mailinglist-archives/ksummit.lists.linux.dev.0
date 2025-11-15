Return-Path: <ksummit+bounces-2610-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 315B3C60A4C
	for <lists@lfdr.de>; Sat, 15 Nov 2025 20:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C2434E1FDA
	for <lists@lfdr.de>; Sat, 15 Nov 2025 19:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DE2283FF0;
	Sat, 15 Nov 2025 19:02:52 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252AD238176
	for <ksummit@lists.linux.dev>; Sat, 15 Nov 2025 19:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763233372; cv=none; b=fxyaTPSke1Bifx4whdUo5pCdztGv/PjWGwhnEDm2onf82CT8ihyVehI7CCX1ewmElW27lOXXQi7OrXGoraYxg7QFNLUvrv++f3p3cYYskcKIBTFi1WBKEH7pmgmgpUGmNILLyedBDmghZkAJC2dfifu/rn7uUt19v7Bl+v7GdfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763233372; c=relaxed/simple;
	bh=FHdhMpf/jdA84CfaTAXSvNbEQT/GOewXqaWP7XurmqA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLy5rgoonkTqmJXfcWCkZ8ctzqX06W4BihxAB7TFvjSUGPMeXBAjHca1LGS1Rr4q1SpWoESpCl7w+GHOM+WgB2J7GmFkWax9EfUjHa4Gy62EZzGIidjCxDMWA2wDRgpBGmO1oyCUGIzCrfts/IjI6WtVcuwPRrToriorKO1Xuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf15.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 546B75B7C9;
	Sat, 15 Nov 2025 19:02:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id DF52317;
	Sat, 15 Nov 2025 19:02:38 +0000 (UTC)
Date: Sat, 15 Nov 2025 14:02:41 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: dave@sr71.net, Shuah Khan <shuah@kernel.org>, Kees Cook
 <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel
 Ojeda <ojeda@kernel.org>, NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Dan Williams <dan.j.williams@intel.com>,
 Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20251115140241.3ce1de0e@batman.local.home>
In-Reply-To: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
References: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: zwqa53pau3h46bu4unzjeyg4cfdy8m3x
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: DF52317
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX199mJ4JxAZ1Mj0aPrMsvEk6wKJyp6pV6Xc=
X-HE-Tag: 1763233358-929683
X-HE-Meta: U2FsdGVkX19/O6baWHRv/dTFCo1uglXa9rQ/fp+pW2NIj0l4h9PU0hhUF7KKdWCWkpUGZ6YSAv+4RoS++dUE+bN0jf9QLQOdeyrEWQ9OprXL2YR1PpW4dL52RRVM3DHZCPKswgduu0NKkge1VJFLv/3LSHYJH1Npt0u4ZAs7SnuhEniYqbjCsWtd6ANVfICxVkazXNK6eeT3V35I5ZcBZ/9nqhUaxSIiIrayBuXkCBgc85ndzz/KjUzgsHl9eRv5psz+twCYkWMs2HrQ2aqEOw8hTQv0uPSHqNYbBeg1Pz7bXHkHD1h2LlZloo72xvifBKl5b0/dsn4I94JW1vPtaUn/pg1lJGHcLIkwJWdbFYrHYD0CzPibcG7XpmrTz2oTSOJnPZMwQMFVcUvch6oqr9lEY4vJMk5Q/Bs1vPBJimG30xggnW5rMKK7oiw6zRF4JFUaV2FbpvPXPAB54ApkD46BBx9otanLrSG+BoZ+2IKIrIdp9AKHg3DCk9rCKQ2duiKMZ9Txk3VSwVGDi5Aaf4LID1YYwacJWnYI3baNyTSAerCTESKMBm7o6Cet4lUHY2mlcGIkBgjtbvAIOXO6ZpqQxndhSTtCsjP5xgzYRMm8mrUouo6Mzw==

On Fri, 14 Nov 2025 10:35:28 -0800
Dave Hansen <dave.hansen@linux.intel.com> wrote:

> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
> 
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.
> 
> Note, though, there are fundamentally no new or unique rules in this
> new document. It clarifies expectations that the kernel community has
> had for many years. For example, researchers are already asked to
> disclose the tools they use to find issues in
> Documentation/process/researcher-guidelines.rst. This new document
> just reiterates existing best practices for development tooling.
> 
> In short: Please show your work and make sure your contribution is
> easy to review.

Thanks Dave for pushing this through!

Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Shuah Khan <shuah@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Cc: NeilBrown <neilb@ownmail.net>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Sasha Levin <sashal@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: workflows@vger.kernel.org
> Cc: ksummit@lists.linux.dev

