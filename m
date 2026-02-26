Return-Path: <ksummit+bounces-2835-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yORNCgAKoGm4fQQAu9opvQ
	(envelope-from <ksummit+bounces-2835-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 26 Feb 2026 09:53:20 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1E81A2EE3
	for <lists@lfdr.de>; Thu, 26 Feb 2026 09:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 450563022061
	for <lists@lfdr.de>; Thu, 26 Feb 2026 08:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE82C395252;
	Thu, 26 Feb 2026 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QYBj00G1"
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A082AE68
	for <ksummit@lists.linux.dev>; Thu, 26 Feb 2026 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772095991; cv=none; b=JUXN5aeLORTmAc9/l6Cx8ZrwffF0BoMjFx3aCEZKgliaAgKRYp9H8EYAvwpD8fy6v2d2wWDvRsxVGwdrwfZW/JqNrVIrmkKYnMTO7t9rpgdnUOW/RPNON9EEEnrO357jtBfrjCYzxqPQJ7nbn+PHD+DrLjcLPGfwZBebiEzqpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772095991; c=relaxed/simple;
	bh=HDeSzHn7jsGZwSOSdxuE4JyWkV4xKRMs5dPiAO9n9bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oshgN7bkr/y8/c43reVk88WOOikG7doL6UjJozGU0JEbYngZPRGV5AJJUPyZDxQUTCHzX61vwL+93QYLKck1ge9gkqOVPoKEL/UK1eYM+4VNieEw19RMotTNgqAFjrteThvFMsjGnGzwd4cxo/wz5lAVwFJSj0aUXuMP8BvTXcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QYBj00G1; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fM4l56SWJz8hJK;
	Thu, 26 Feb 2026 08:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772095473;
	bh=HDeSzHn7jsGZwSOSdxuE4JyWkV4xKRMs5dPiAO9n9bw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QYBj00G1sUGQe6F69RwwB0lAodIZ1dsXd4etPPBFhb8IvDCO1Q026GAuGzFiV0fb6
	 TjtN2Z8X96l5pUdemroEd+o2swLG5xcGwWFXtPxDsJT787TZVfziGcgI/E5sc6r9gR
	 VzPbRhzO9LjVNjQ9fcmIBEyoIRgyKlXNinIEDqSc5XVdKPu+HklppiJC3KEf8WKc6F
	 kM7TFITzz9Bm+uakOGpXtFGXflk/U10O2E9k6iA9/oYGIBj6nkWmDN40h7DZ0hhvWy
	 rSZjTGZtDDji3BT75m4A/96vGpz2GWiCQEiE2AV2Gqtiomunsk7tjQ1qG/Li3q11Hx
	 U4qwWVQWl8Shw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fM4l55jsKz8hH0;
	Thu, 26 Feb 2026 08:44:33 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fM4l51wWFz8sWT;
	Thu, 26 Feb 2026 09:44:33 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 553A067458;
	Thu, 26 Feb 2026 09:44:32 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b93eae05-5e40-42f0-8256-d46d411008a4@leemhuis.info>
Date: Thu, 26 Feb 2026 09:44:32 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: slowly decommission bugzilla? (was: Re: kernel.org tooling update)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 ksummit@lists.linux.dev
References: <20251209-roaring-hidden-alligator-068eea@lemur>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 xsFNBFJ4AQ0BEADCz16x4kl/YGBegAsYXJMjFRi3QOr2YMmcNuu1fdsi3XnM+xMRaukWby47
 JcsZYLDKRHTQ/Lalw9L1HI3NRwK+9ayjg31wFdekgsuPbu4x5RGDIfyNpd378Upa8SUmvHik
 apCnzsxPTEE4Z2KUxBIwTvg+snEjgZ03EIQEi5cKmnlaUynNqv3xaGstx5jMCEnR2X54rH8j
 QPvo2l5/79Po58f6DhxV2RrOrOjQIQcPZ6kUqwLi6EQOi92NS9Uy6jbZcrMqPIRqJZ/tTKIR
 OLWsEjNrc3PMcve+NmORiEgLFclN8kHbPl1tLo4M5jN9xmsa0OZv3M0katqW8kC1hzR7mhz+
 Rv4MgnbkPDDO086HjQBlS6Zzo49fQB2JErs5nZ0mwkqlETu6emhxneAMcc67+ZtTeUj54K2y
 Iu8kk6ghaUAfgMqkdIzeSfhO8eURMhvwzSpsqhUs7pIj4u0TPN8OFAvxE/3adoUwMaB+/plk
 sNe9RsHHPV+7LGADZ6OzOWWftk34QLTVTcz02bGyxLNIkhY+vIJpZWX9UrfGdHSiyYThHCIy
 /dLz95b9EG+1tbCIyNynr9TjIOmtLOk7ssB3kL3XQGgmdQ+rJ3zckJUQapLKP2YfBi+8P1iP
 rKkYtbWk0u/FmCbxcBA31KqXQZoR4cd1PJ1PDCe7/DxeoYMVuwARAQABzSdUaG9yc3RlbiBM
 ZWVtaHVpcyA8bGludXhAbGVlbWh1aXMuaW5mbz7CwZQEEwEKAD4CGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AWIQSoq8a+lZZX4oPULXVytubvTFg9LQUCaOO74gUJHfEI0wAKCRBytubv
 TFg9Lc4iD/4omf2z88yGmior2f1BCQTAWxI2Em3S4EJY2+Drs8ZrJ1vNvdWgBrqbOtxN6xHF
 uvrpM6nbYIoNyZpsZrqS1mCA4L7FwceFBaT9CTlQsZLVV/vQvh2/3vbj6pQbCSi7iemXklF7
 y6qMfA7rirvojSJZ2mi6tKIQnD2ndVhSsxmo/mAAJc4tiEL+wkdaX1p7bh2Ainp6sfxTqL6h
 z1kYyjnijpnHaPgQ6GQeGG1y+TSQFKkb/FylDLj3b3efzyNkRjSohcauTuYIq7bniw7sI8qY
 KUuUkrw8Ogi4e6GfBDgsgHDngDn6jUR2wDAiT6iR7qsoxA+SrJDoeiWS/SK5KRgiKMt66rx1
 Jq6JowukzNxT3wtXKuChKP3EDzH9aD+U539szyKjfn5LyfHBmSfR42Iz0sofE4O89yvp0bYz
 GDmlgDpYWZN40IFERfCSxqhtHG1X6mQgxS0MknwoGkNRV43L3TTvuiNrsy6Mto7rrQh0epSn
 +hxwwS0bOTgJQgOO4fkTvto2sEBYXahWvmsEFdLMOcAj2t7gJ+XQLMsBypbo94yFYfCqCemJ
 +zU5X8yDUeYDNXdR2veePdS3Baz23/YEBCOtw+A9CP0U4ImXzp82U+SiwYEEQIGWx+aVjf4n
 RZ/LLSospzO944PPK+Na+30BERaEjx04MEB9ByDFdfkSbM7BTQRSeAENARAAzu/3satWzly6
 +Lqi5dTFS9+hKvFMtdRb/vW4o9CQsMqL2BJGoE4uXvy3cancvcyodzTXCUxbesNP779JqeHy
 s7WkF2mtLVX2lnyXSUBm/ONwasuK7KLz8qusseUssvjJPDdw8mRLAWvjcsYsZ0qgIU6kBbvY
 ckUWkbJj/0kuQCmmulRMcaQRrRYrk7ZdUOjaYmjKR+UJHljxLgeregyiXulRJxCphP5migoy
 ioa1eset8iF9fhb+YWY16X1I3TnucVCiXixzxwn3uwiVGg28n+vdfZ5lackCOj6iK4+lfzld
 z4NfIXK+8/R1wD9yOj1rr3OsjDqOaugoMxgEFOiwhQDiJlRKVaDbfmC1G5N1YfQIn90znEYc
 M7+Sp8Rc5RUgN5yfuwyicifIJQCtiWgjF8ttcIEuKg0TmGb6HQHAtGaBXKyXGQulD1CmBHIW
 zg7bGge5R66hdbq1BiMX5Qdk/o3Sr2OLCrxWhqMdreJFLzboEc0S13BCxVglnPqdv5sd7veb
 0az5LGS6zyVTdTbuPUu4C1ZbstPbuCBwSwe3ERpvpmdIzHtIK4G9iGIR3Seo0oWOzQvkFn8m
 2k6H2/Delz9IcHEefSe5u0GjIA18bZEt7R2k8CMZ84vpyWOchgwXK2DNXAOzq4zwV8W4TiYi
 FiIVXfSj185vCpuE7j0ugp0AEQEAAcLBfAQYAQoAJgIbDBYhBKirxr6Vllfig9QtdXK25u9M
 WD0tBQJo47viBQkd8QjTAAoJEHK25u9MWD0tCH8P/1b+AZ8K3D4TCBzXNS0muN6pLnISzFa0
 cWcylwxX2TrZeGpJkg14v2R0cDjLRre9toM44izLaz4SKyfgcBSj9XET0103cVXUKt6SgT1o
 tevoEqFMKKp3vjDpKEnrcOSOCnfH9W0mXx/jDWbjlKbBlN7UBVoZD/FMM5Ul0KSVFJ9Uij0Z
 S2WAg50NQi71NBDPcga21BMajHKLFzb4wlBWSmWyryXI6ouabvsbsLjkW3IYl2JupTbK3viH
 pMRIZVb/serLqhJgpaakqgV7/jDplNEr/fxkmhjBU7AlUYXe2BRkUCL5B8KeuGGvG0AEIQR0
 dP6QlNNBV7VmJnbU8V2X50ZNozdcvIB4J4ncK4OznKMpfbmSKm3t9Ui/cdEK+N096ch6dCAh
 AeZ9dnTC7ncr7vFHaGqvRC5xwpbJLg3xM/BvLUV6nNAejZeAXcTJtOM9XobCz/GeeT9prYhw
 8zG721N4hWyyLALtGUKIVWZvBVKQIGQRPtNC7s9NVeLIMqoH7qeDfkf10XL9tvSSDY6KVl1n
 K0gzPCKcBaJ2pA1xd4pQTjf4jAHHM4diztaXqnh4OFsu3HOTAJh1ZtLvYVj5y9GFCq2azqTD
 pPI3FGMkRipwxdKGAO7tJVzM7u+/+83RyUjgAbkkkD1doWIl+iGZ4s/Jxejw1yRH0R5/uTaB MEK4
In-Reply-To: <20251209-roaring-hidden-alligator-068eea@lemur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177209547256.1134791.8321300512533618421@mxe9fb.netcup.net>
X-NC-CID: lESznZmD+LAHxjIIu4i0SeT/r3er2Bb6U67qTTgKIhC63ZRLrTY=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	DMARC_NA(0.00)[leemhuis.info];
	TAGGED_FROM(0.00)[bounces-2835-lists=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@leemhuis.info,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url,leemhuis.info:mid,leemhuis.info:dkim];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: BC1E81A2EE3
X-Rspamd-Action: no action

On 12/10/25 05:48, Konstantin Ryabitsev wrote:
>
> ### Bugzilla

Lo! I wonder if we should slowly and publicly start decommission
bugzilla in areas where it's not working well today. I have a few
reasons for that:

> It may be time to kill bugzilla:
> 
>     - despite periodic "we're not dead yet" emails, it doesn't appear very
>       active
>     - the upgrade path to 6.0 is broken for us due to bugzilla abandoning the
>       5.2 development branch and continuing with 5.1

* It looks like we will decommission Bugzilla anyway, and a replacement
is afaics likely quite a while (years?) away -- so what is there now
will likely be kept running for a while.

* Bugzilla at the same time since a few years now is known to not
working well, as many reports (including good ones) never get a reply --
among others because the list of products/components is not kept in
sync, so many reports never reach the right developers (see
https://lwn.net/Articles/910740/ and the second and third links there
for the more complete backstory; things are afaics round about the same
from what I see when occasionally looking at bugzilla for regression
reports worth forwarding by mail – and that is really hard to watch, as
it feels bad to see people spending time on something that is most
likely not leading to anything).

* Statements like "Dear Deity, I do wish kernel MM bugzilla would just
go away. Sigh." (akpm recently in
https://lore.kernel.org/all/20260206121151.dea3633d1f0ded7bbf49c22e@linux-foundation.org/)

"Slowly start publicly decommissioning Bugzilla" could look like this:

* Prevent new bugs from being submitted against products/components
where the developers/subsystems are not engaging in Bugzilla (either
directly or through replies by mail). That would make people like akpm
happy afaics. I'm willing to help with talking to subsystems and
adjusting settings in bugzilla.

* Create a new front page that tells users that they most likely are in
the wrong place. The text could look like this:

"""
Welcome! Note: The kernel.org bugzilla is slowly being decommissioned!

This bug tracker is a kind of failed experiment, which at the same time
still is useful sometimes and thus for now kept alive. Due to this and
how vendors utilize the Linux kernel, you are most likely in the wrong
place to report your bug.

To find the right place, check the Linux kernel's [MAINTAINERS
file](https://docs.kernel.org/process/maintainers.html). Most of the
time it will tell you to report bugs by email with some mailing lists in
CC. Bugs with all the kernel's modern graphics drivers, on the other
hand, [must be submitted to a Gitlab
instance](https://gitlab.freedesktop.org/drm) – and a small number of
subsystems want reports in issue trackers of dedicated Github projects
or this bug tracker.

For more details on this and reporting Linux kernel bugs in general, see
the [official step-by-step guide on reporting
issues](https://docs.kernel.org/admin-guide/reporting-issues.html#step-by-step-guide-how-to-report-issues-to-the-kernel-maintainers).
It covers all the important aspects, including one that is often missed:

In case somebody else compiled your Linux kernel, you most likely have
to report bugs to said vendor – like Linux Mint, Red Hat, Ubuntu, or
SUSE. That is because the majority of the Linux developers only care for
bugs occurring with kernels built from Linux sources that are pristine
(aka "vanilla") or nearly so. Kernels using independently developed
kernel modules are therefore just as unsuitable for reporting bugs upstream.
"""

Sigh, too much text, but you get the idea.

Ciao, Thorsten


