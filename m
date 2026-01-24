Return-Path: <ksummit+bounces-2817-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WQiDGaRcdWlFEgEAu9opvQ
	(envelope-from <ksummit+bounces-2817-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 25 Jan 2026 00:58:28 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 975067F4D3
	for <lists@lfdr.de>; Sun, 25 Jan 2026 00:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DAF9300CC29
	for <lists@lfdr.de>; Sat, 24 Jan 2026 23:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D1F258EDB;
	Sat, 24 Jan 2026 23:58:21 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7773C1459FA;
	Sat, 24 Jan 2026 23:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769299101; cv=none; b=H+1GffCDeNHMdLrObkhnyGTX4sfYQEA7+Zr1A9ZlT26tLN/8hHIg700VEN2QeulbGoaZRI+ahCVYZ7EhwJTRV7yZkAWc7mc8vwXQhsZfARxYs1DDWkg44CaGNjLwNyEPnW1ujF5mgBcnEPtqtIfp0Zoih9axEIVSt235y8Y1yF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769299101; c=relaxed/simple;
	bh=saHIipS+hLdw6ysbHJ14pvXa+XUw9lAtZFsA4RiiXDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M2cKXZKOD59mfI9dD4pjjadbotNo8zOz4W3nho4JwH0W31ZDRaHVYhBHdRjhzuTnUUhj7tq3tH+dj5PAxSKPrTpIOrhCBfJ2nvq8oSZHuTdH2JMTUmNTFt+IT6Bz+DobYnPall51abKJWDak6/rZVawDvSixGIzfEBZYnAGaUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 04B351AFF2A;
	Sat, 24 Jan 2026 23:58:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf02.hostedemail.com (Postfix) with ESMTPA id C57118000E;
	Sat, 24 Jan 2026 23:58:15 +0000 (UTC)
Date: Sat, 24 Jan 2026 18:58:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: corbet@lwn.net, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linux.dev, Linus Torvalds
 <torvalds@linux-foundation.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook
 <kees@kernel.org>
Subject: Re: [PATCH] Documentation: Project continuity
Message-ID: <20260124185814.513d3aab@robin>
In-Reply-To: <20260124012256.1856709-1-dan.j.williams@intel.com>
References: <20260124012256.1856709-1-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: jm9ar4tn5m54g895tkobwp3kdbg6oqr1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18v/yTK2Q2Ud71KQ5/Pet/SjbS6swFFiU4=
X-HE-Tag: 1769299095-86071
X-HE-Meta: U2FsdGVkX19eK+dTTPvyyglZFDT+yJA7vyBi8kMIFBIDCxij2wMcDyOXEas9yWWEyEag5yV13dOFDWE99ofV2QvL7yk3yeF2SCP/uGRvuydrdKlvMCU8IykQ1ORYY8omhsX4bTveFEUi/1vcOOQ2UHcxwhZ+LwUOPcIlwk6DFQrgLw5NWXBGP3DhIm+U91sUMQuMg9wYUbKPF5XCzOzG7DmT6yS15at1eFB6nl/pdl5O61GKy9PVP7cxaGHFFkjNtLJmhn/2F5pM5fJHXzRY4+pwvMSvDS59p+KvutdxWcqWgeOM/s5VU7IMxoX8sTaNkEHaUNeJztUOQTNkCENtIj6lykmjXmuHkmMkpPsr1OiX3B7mvY5DYbanqkVP8WaF8g8rfBIzTdc+bp6IFzJgKwzKqzeTQdgpKgoFeTxeGueeDXQ0xwDzLI+8koeD05RUEls7AudFXO3eCnJMGjhiiHbTVps/NX64kUT8xCP7yDqgU1CAcFNZMIsOKz7id8OVtmrUf/bQkpOR+DX7Y64/oewhXxFaRVQeQteJO8EpGoEXRM+XlawzK8srVfSYRybOadY9XDMpCuW+K3dW4SqlDmQt/UxoX/Vy
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2817-lists=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linuxfoundation.org:email,linux-foundation.org:email,goodmis.org:email]
X-Rspamd-Queue-Id: 975067F4D3
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 17:22:56 -0800
Dan Williams <dan.j.williams@intel.com> wrote:

> Document project continuity procedures. This is a plan for a plan for
> navigating events that affect the forward progress of the canonical Linux
> repository, torvalds/linux.git. It is a follow-up from Maintainer Summit
> [1].
> 
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Co-developed-by: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> Link: https://lwn.net/Articles/1050179/ [1]
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

I thought I sent this out earlier, but anyway...

  Reviewed-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

