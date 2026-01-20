Return-Path: <ksummit+bounces-2789-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CZYBG0BcGmUUgAAu9opvQ
	(envelope-from <ksummit+bounces-2789-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 20 Jan 2026 23:27:57 +0100
X-Original-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A744CF50
	for <lists@lfdr.de>; Tue, 20 Jan 2026 23:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2425E902EA9
	for <lists@lfdr.de>; Tue, 20 Jan 2026 21:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA243E8C42;
	Tue, 20 Jan 2026 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ILXJTjV6"
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63583A9DA9
	for <ksummit@lists.linux.dev>; Tue, 20 Jan 2026 21:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946208; cv=none; b=UobbfbhCttftwUOtPcOaI3Nznlyu1Q8sz0P0+YQeMbY2lzotnhjmLAh0Ulr+RKZre8E3l1AAx9UQ8EoIh0j3TqITnUVPaEeRADGqpiIktg888xoznc+CHB6CHHNVAJ37ZyauzCdgF4q7fgxxjuTeETrexSu3aA0c9Hkb273qpa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946208; c=relaxed/simple;
	bh=FzMdzP56GstVKF3ZixDpDHYfJlLiP7DaiRtIzsPUWEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gFFRECVhkunc419eV28P24MsM3XEJQJWnLeTbTB7M5GFaAW6Y+KLf0ce3DZr0BpZeVrUymtE8X7ntuHQhxVOMCaRgSwxit/3jPxTZnodYH0lQ4z6VIEelZbjmS3oC+TCemsIM3yEWb0B9nyVQJNqmJxUWWEvBZm1DF9SLue/g14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ILXJTjV6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AFDFB40C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768946205; bh=FzMdzP56GstVKF3ZixDpDHYfJlLiP7DaiRtIzsPUWEo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ILXJTjV6WVHwCAaJbaVr5hmn9Ig2K/FElbm3cj3MR2ai1xd6MBPm1W2bEC4EEe/pL
	 gLZSEajMQMvp0tAXbmrx+skTYKI+fYr/6PaHLbdh9maXaiLlGj5CG8x6WZRm8BSJ0T
	 TpibuAa6Jxe1AiCeeiiMXgEBSdGK7yIRdo7WlfuP9l1NIM+xIlnVDwLLOSwEcLJ8ql
	 ctsE09YIy2th0RPGQ83JFzh8lFtfJbmO4x8J8fp6CW0j2rEQzUXmlKXrJrXT9x7DOt
	 1i+YWZ0TgcKPqqTsXpC+qe7cS9J/7sCeMrS6q/uiyco6ATiD7tU2JxfFdxOOInClWB
	 FW7Jobfyx2neg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AFDFB40C27;
	Tue, 20 Jan 2026 21:56:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan
 <shuah@kernel.org>, Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Dan
 Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, Simon Glass
 <simon.glass@canonical.com>, Lee Jones <lee@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, NeilBrown <neilb@ownmail.net>, Theodore Ts'o
 <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Vlastimil Babka
 <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: [PATCH] [v6] Documentation: Provide guidelines for
 tool-generated content
In-Reply-To: <20260119200418.89541-1-dave.hansen@linux.intel.com>
References: <20260119200418.89541-1-dave.hansen@linux.intel.com>
Date: Tue, 20 Jan 2026 14:56:44 -0700
Message-ID: <87cy34hrs3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2789-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,intel.com,goodmis.org,canonical.com,oracle.com,ownmail.net,mit.edu,suse.cz,vger.kernel.org,lists.linux.dev];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lwn.net,none];
	DKIM_TRACE(0.00)[lwn.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lwn.net:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: C2A744CF50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dave Hansen <dave.hansen@linux.intel.com> writes:

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
> disclose the tools they use to find issues by
> Documentation/process/researcher-guidelines.rst. This new document
> just reiterates existing best practices for development tooling.
>
> In short: Please show your work and make sure your contribution is
> easy to review.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>

OK, it seems this is ready, so I've just applied it, thanks.

jon

