Return-Path: <ksummit+bounces-2818-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAstMcrMdmktWwEAu9opvQ
	(envelope-from <ksummit+bounces-2818-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 26 Jan 2026 03:09:14 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E454183674
	for <lists@lfdr.de>; Mon, 26 Jan 2026 03:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E43E3005AE3
	for <lists@lfdr.de>; Mon, 26 Jan 2026 02:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE45202C5C;
	Mon, 26 Jan 2026 02:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgiQCIU1"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C9B1534EC;
	Mon, 26 Jan 2026 02:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769393350; cv=none; b=tbSQhXlAcI2a2EvYX+ik6ZxwagNSOZyLYF5aj7YOkUJR7eEg6dmDLP+engdkgzw0xp/oeAsZoNUTTdmlyz1tFLT5459vwS5d5ZKf9NhMKVN/5piPiMv7AUfxJ8hFV8fK1W0egZGSYkgN56hHIm6gdUBbUjZ5aFMGfD9iTnVGtJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769393350; c=relaxed/simple;
	bh=4zm3mbnX+42KEvPpA2xHQIh7/uRFC22ZxiY0vvFQa2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYX45T1gyocdLilg4l48dDAmClvAzVgJDqs1uaGR9XVoepVnPURu0rH/WGWbbx0eME7XVmfNzgpmiJp1qYm1StuBmOjysaBvDFy8kc1uvzq7p3PwtMJJENwFpX2/u2RY+fG43F8xftM/1a26GFImaUgvBC2CHQWdC7QDc5rAMyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgiQCIU1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57780C4CEF1;
	Mon, 26 Jan 2026 02:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769393349;
	bh=4zm3mbnX+42KEvPpA2xHQIh7/uRFC22ZxiY0vvFQa2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jgiQCIU18lyvbhmxLny7ppbZFIdURuVtKANoaYSMBM9zq86g2yKNUjfo2Z1ycJ9gn
	 nM8t/dcJfg8OIeQa2IgjU8OYXEfZ4jCir1YuEWQlNub9hLpQtHLCTNoFDb4JDsniI1
	 6xbsN8lkdIBMyuteZqJNkN36YKHpqD4ynJzoWGBut2cN6IqG4D2ypn3brg/0C4I70h
	 B7Fq1FcCuWz0b87QECXXgWVEBB/6ONJX2sOLCxKg3vUpIxT5GwV26KJHTC1yDhJue7
	 M5ypR//P8N4J5y+uKy8AwNsfjSWafnreVmEdSb0+PDls8JVg/HMCImy1qhRYC3AEJ9
	 me6XQgb2+GgbA==
Message-ID: <fbfa644c-c592-42bd-9c4f-a4d42984d244@kernel.org>
Date: Sun, 25 Jan 2026 19:08:48 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: Project continuity
To: Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linux.dev,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260124012256.1856709-1-dan.j.williams@intel.com>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <20260124012256.1856709-1-dan.j.williams@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2818-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuah@kernel.org,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,lwn.net:email,linuxfoundation.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: E454183674
X-Rspamd-Action: no action

On 1/23/26 18:22, Dan Williams wrote:
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
> ---
>   Documentation/process/conclave.rst | 41 ++++++++++++++++++++++++++++++
>   Documentation/process/index.rst    |  1 +
>   2 files changed, 42 insertions(+)
>   create mode 100644 Documentation/process/conclave.rst
> 
>
Loos good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

