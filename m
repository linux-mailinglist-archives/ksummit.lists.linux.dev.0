Return-Path: <ksummit+bounces-2797-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIr9II6Uc2ktxQAAu9opvQ
	(envelope-from <ksummit+bounces-2797-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 16:32:30 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D677D14
	for <lists@lfdr.de>; Fri, 23 Jan 2026 16:32:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2E7730484C4
	for <lists@lfdr.de>; Fri, 23 Jan 2026 15:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D93A1CAA68;
	Fri, 23 Jan 2026 15:30:28 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF41621578D
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 15:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769182228; cv=none; b=NTUAC9WrCvjLOgRjtM91i/zxa/i9T0fqNcKNxzWgnHo9Tqnnlikyv6ZoXtx0csxDEMGE8NI6Qq4nFAcHnkgYpaff/iewbZ4/Jo0D4ZTvycEzyVsz6se/KqdRC8iZJm4tYZhdQd5geepFoIztwAIlRxYy9G/HQ3z9VCOwJ0pz60w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769182228; c=relaxed/simple;
	bh=PX3+P9NHk0IfgQwPFC3RikYDjuSYUdRfphtiW1u6Qiw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3y2lGHKikdYgq0AEstrJKyC5aY9sixWh/3h7iiHIV5qMLG/M+b1vaAQW1j0xSdMZzBwaKfpcBiTUnio99lmA0Ln4vyI0uPohlCjYCbjIOUxjUkA+z20NYSDdLDbKf73Woj3pK5k9indL8mVayL9lQCvEyOFolxfHFiz3UXUZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 8E3EB58A8B;
	Fri, 23 Jan 2026 15:30:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 980C632;
	Fri, 23 Jan 2026 15:30:13 +0000 (UTC)
Date: Fri, 23 Jan 2026 10:30:40 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, Kees Cook
 <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel
 Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae
 Park <sj@kernel.org>, Dan Williams <dan.j.williams@intel.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Simon Glass <simon.glass@canonical.com>,
 Lee Jones <lee@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 NeilBrown <neilb@ownmail.net>, Theodore Ts'o <tytso@mit.edu>, Sasha Levin
 <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka
 <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v6] Documentation: Provide guidelines for
 tool-generated content
Message-ID: <20260123103040.7752d6c1@gandalf.local.home>
In-Reply-To: <20260119200418.89541-1-dave.hansen@linux.intel.com>
References: <20260119200418.89541-1-dave.hansen@linux.intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ynx3dp1d9zmm9gf7ttrjopqwtzscoyap
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/KdcdpU+QlIlkrpbCjac/OSaLtzcBWSAs=
X-HE-Tag: 1769182213-938313
X-HE-Meta: U2FsdGVkX1+VJ5sLu6eB44ziFPwm6k7hhsBJMjcgXkfbw6yMd/rH5Qfjh7WtRaUBcu3jVFvdwi29R/dzc9i2ysMBJLXXkYOdRdAcKaVCx+W+AyfwODmzRXlUtkRd9BEM+zsVCz4m4ULvRrWx5LYVRxGH178vuO/pKUi+CL9IcyDs0B2Ia3LrsgSj74GzQt9W5yt+yVC2dwpRZdwRh5PlpIAIVfiu64l/TfSLHGk1N8p2PEksKUZJOfVxraEdpP7ydhGpdATRbz0RNL3UyVtSjfgz5x5p8Rq9wduWsUvihqldPTLZgxHod8Te9Z/6AZlsJE+v9pqWzZ3BEJdZ/JhkSoho5kIUlIeR
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	R_DKIM_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2797-lists=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linuxfoundation.org,intel.com,canonical.com,oracle.com,ownmail.net,mit.edu,lwn.net,suse.cz,lists.linux.dev];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gandalf.local.home:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: DC2D677D14
X-Rspamd-Action: no action

On Mon, 19 Jan 2026 12:04:18 -0800
Dave Hansen <dave.hansen@linux.intel.com> wrote:

I decided to go over it one last time.
> +
> +Out of Scope
> +============
> +
> +These guidelines do not apply to tools that make trivial tweaks to
> +preexisting content. Nor do they pertain to tooling that helps with
> +menial tasks. Some examples:
> +
> + - Spelling and grammar fix ups, like rephrasing to imperative voice
> + - Typing aids like identifier completion, common boilerplate or
> +   trivial pattern completion
> + - Purely mechanical transformations like variable renaming
> + - Reformatting, like running Lindent, ``clang-format`` or
> +   ``rust-fmt``
> +
> +Even whenever your tool use is out of scope, you should still always

Somehow the above reads really weird to me. "Even whenever your tool use is
out of scope". Do you mean "Even when your tool use is out of scope" ?


> +consider if it would help reviewing your contribution if the reviewer
> +knows about the tool that you used.
> +

Other than that, LGTM!

Thanks,

-- Steve

