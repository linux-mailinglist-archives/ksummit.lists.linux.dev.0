Return-Path: <ksummit+bounces-1232-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4839066EB
	for <lists@lfdr.de>; Thu, 13 Jun 2024 10:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83A461C224A2
	for <lists@lfdr.de>; Thu, 13 Jun 2024 08:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1512A140E38;
	Thu, 13 Jun 2024 08:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="qjLvwFu1"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E89B13D50A
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 08:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718267551; cv=none; b=b3paIYteKM4M4hBap7YJjIK972H7hBR6gwgp+XJjXdzbLjH2SsKtsKQNNZ///C1LWYgfEwefNNiHgy/ZCHMRWEuIbcXLfVulh8EcXWK/VTvLqLtva7QnukUJz3VUJ3FfdBv+n3Y3sx16jkEWiaexrby64A3YjblnYmiaqp1Pkqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718267551; c=relaxed/simple;
	bh=x8GlQqiUvKSl4F5pO4w745t4Xna2l++xrX+weUwIVio=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Zdj3645WxTD/oViyeXESim3pMNce3XojK96OprZ+JIIQX/HB4jCMez0I7bgwMaXVq62Ckny+HUFmv95uJWWo7nCUffe9GUvUChUOQ9QWeDuSORc7qz9EUzBHHUt6/CWXdtQam1y9cskHD6I1UwwkNf1XRlIc+uZsd+qhrLq+dJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=qjLvwFu1; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=x8GlQqiUvKSl4F5pO4w745t4Xna2l++xrX+weUwIVio=; t=1718267549;
	x=1718699549; b=qjLvwFu1djBO/GZs4QL4Vt3CCzgtZ6T5yxuoR+bYdit2EX6mdBke1vpzVdJ1/
	BT/pYfUZMiEeHIqYqLWumFyeV3DvGBBNRPcBih2MEXsCY+5KvX7U4/bIvH3tlMw9VIDfsn3F47tZN
	w0iAG0od4c0veGSeAGen+MQmJ0DJJiFvOla5akLZ+e3ncorgJDjwmfvlO6TLojwX4vZe8x+13X5gJ
	qbXG3O2wCdfskqTqYoVSDM1nWWi3JXdPdLe1Cl25stb7h3W9AH07o7JmrDPGqlnZLkuD4ewpRshuZ
	lpHlcSbov7t8EJFnkxsIj5LABb0mUDn964ibrNs9r7T81+Ci+w==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sHfsh-0004dp-K6; Thu, 13 Jun 2024 10:32:27 +0200
Message-ID: <c10b7cb2-6ea8-4a15-86a7-9ae689064f6b@leemhuis.info>
Date: Thu, 13 Jun 2024 10:32:27 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [MAINTAINERS SUMMIT] [2/4] Ensure recent mainline regression are
 fixed in latest stable series
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Content-Language: en-US, de-DE
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
 FgIDAQACHgECF4AWIQSoq8a+lZZX4oPULXVytubvTFg9LQUCX31PIwUJFmtPkwAKCRBytubv
 TFg9LWsyD/4t3g4i2YVp8RoKAcOut0AZ7/uLSqlm8Jcbb+LeeuzjY9T3mQ4ZX8cybc1jRlsL
 JMYL8GD3a53/+bXCDdk2HhQKUwBJ9PUDbfWa2E/pnqeJeX6naLn1LtMJ78G9gPeG81dX5Yq+
 g/2bLXyWefpejlaefaM0GviCt00kG4R/mJJpHPKIPxPbOPY2REzWPoHXJpi7vTOA2R8HrFg/
 QJbnA25W55DzoxlRb/nGZYG4iQ+2Eplkweq3s3tN88MxzNpsxZp475RmzgcmQpUtKND7Pw+8
 zTDPmEzkHcUChMEmrhgWc2OCuAu3/ezsw7RnWV0k9Pl5AGROaDqvARUtopQ3yEDAdV6eil2z
 TvbrokZQca2808v2rYO3TtvtRMtmW/M/yyR233G/JSNos4lODkCwd16GKjERYj+sJsW4/hoZ
 RQiJQBxjnYr+p26JEvghLE1BMnTK24i88Oo8v+AngR6JBxwH7wFuEIIuLCB9Aagb+TKsf+0c
 HbQaHZj+wSY5FwgKi6psJxvMxpRpLqPsgl+awFPHARktdPtMzSa+kWMhXC4rJahBC5eEjNmP
 i23DaFWm8BE9LNjdG8Yl5hl7Zx0mwtnQas7+z6XymGuhNXCOevXVEqm1E42fptYMNiANmrpA
 OKRF+BHOreakveezlpOz8OtUhsew9b/BsAHXBCEEOuuUg87BTQRSeAENARAAzu/3satWzly6
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
 WD0tBQJffU8wBQkWa0+jAAoJEHK25u9MWD0tv+0P/A47x8r+hekpuF2KvPpGi3M6rFpdPfeO
 RpIGkjQWk5M+oF0YH3vtb0+92J7LKfJwv7GIy2PZO2svVnIeCOvXzEM/7G1n5zmNMYGZkSyf
 x9dnNCjNl10CmuTYud7zsd3cXDku0T+Ow5Dhnk6l4bbJSYzFEbz3B8zMZGrs9EhqNzTLTZ8S
 Mznmtkxcbb3f/o5SW9NhH60mQ23bB3bBbX1wUQAmMjaDQ/Nt5oHWHN0/6wLyF4lStBGCKN9a
 TLp6E3100BuTCUCrQf9F3kB7BC92VHvobqYmvLTCTcbxFS4JNuT+ZyV+xR5JiV+2g2HwhxWW
 uC88BtriqL4atyvtuybQT+56IiiU2gszQ+oxR/1Aq+VZHdUeC6lijFiQblqV6EjenJu+pR9A
 7EElGPPmYdO1WQbBrmuOrFuO6wQrbo0TbUiaxYWyoM9cA7v7eFyaxgwXBSWKbo/bcAAViqLW
 ysaCIZqWxrlhHWWmJMvowVMkB92uPVkxs5IMhSxHS4c2PfZ6D5kvrs3URvIc6zyOrgIaHNzR
 8AF4PXWPAuZu1oaG/XKwzMqN/Y/AoxWrCFZNHE27E1RrMhDgmyzIzWQTffJsVPDMQqDfLBhV
 ic3b8Yec+Kn+ExIF5IuLfHkUgIUs83kDGGbV+wM8NtlGmCXmatyavUwNCXMsuI24HPl7gV2h n7RI
In-Reply-To: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718267549;d509fd83;
X-HE-SMSGID: 1sHfsh-0004dp-K6

I propose we extend the implications of the "no regressions" rule so
that mainline developers must ensure fixes for recent mainline
regression make it to the latest stable series.

[FWIW, yes I'm well aware that this is a bold proposal; I also have no
idea how even Linus thinks about the idea. But I'm bringing it up anyway
to at least discuss this, as from my point of view it would fix what I
consider a kind of loophole regarding our "no regressions" rule -- at
least from the point of view of the users.]

We might have a "no regressions" rule, but nothing currently makes sure
that regressions introduced recently are fixed in a timely manner in the
latest stable series. Hence a fix for a regression found just hours
after a new mainline release (say 6.7) might only reach users weeks
later with its successor (e.g. 6.8) -- or in unlucky cases when the fix
is only merged in the next merge window and not backported only with the
second successor (6.9). The example scenario at the start of this thread
illustrates that in more details.

To improve this situation I propose we add a rule like the following
somewhere:

"""Developers must ensure that fixes for regressions introduced in the
last development cycle make it to the latest stable series -- typically
by adding 'Fixes:' and 'CC: <stable…' tags to the patch description's
footer."""

I know I'm asking a lot here, especially from the file system folks due
to the testing this will require. And I fully understand the
participation in stable maintenance always has been and still is
optional for mainline developers -- and that this would change it.

But I'm bringing this up anyway, as users afaics expect "fix recently
introduced problems with new minor releases', as it is a pretty normal
thing in most other FLOSS projects that have minor releases. A lot of
kernel developers are already doing what I proposed anyway. It could be
viewed as fair to our user base, too. And without it the "no
regressions" rule might be considered hollow.

Note, to quickly fix such regression in the latest stable series such
regressions obviously must first be fixed in a timely manner in
mainline; that aspect is ignored here, as proposals 3/4 of this thread
will covers that.

Another note: the "Expectations and best practices for fixing
regressions" in Documentation/process/handling-regressions.rst (see
[1/4] kind of covers this already. But it does not use the term "must";
at the same time the scope is bigger, too, which is partly due to a
statement from Linus[1]: """If a regression made it into a proper
mainline release during the past twelve months, ensure to tag the fix
with "Cc: stable@vger.kernel.org", as a "Fixes:" tag alone does not
guarantee a backport. Please add the same tag, in case you know the
culprit was backported to stable or longterm kernels.""""
[1]
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/

Side note: due to the [1] above the rule this messages proposes above
maybe needs 's/introduced in the last development cycle/introduced in
mainline versions released during the past 12 months/" (or five or six
releases instead, as that is easier to keep track of?). But I guess with
that this proposal likely would be even less welcomed. :-/

