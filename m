Return-Path: <ksummit+bounces-2399-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A5B59EAF
	for <lists@lfdr.de>; Tue, 16 Sep 2025 19:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E36116BF2F
	for <lists@lfdr.de>; Tue, 16 Sep 2025 17:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8741632D5DB;
	Tue, 16 Sep 2025 16:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="e/5T4qg1"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB25D32D5D4
	for <ksummit@lists.linux.dev>; Tue, 16 Sep 2025 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758041924; cv=none; b=aCl2zWeihuo5osJ49uX/RWhYnuJZRH9EnZpfEww5mPP9Ayhik9xr21OlRBineT4onC31WneFdwjNWbP1waNTxa8k5ACNk4sASb4lYJHnmJ9eaCknTiQkCNtHRHs8436IoGAcVGKqMRW+o1bFINMrsFqo+6HlDnaGzen3mjr9xkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758041924; c=relaxed/simple;
	bh=o20ydrli1a71Y2LyCeucMd1nn0RzeMH6UuH+Wr36AvA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QMQtc7sKzWoNBo/DfnetpQa4JNnTyQZtFu7dVQmdO3/bMbOiLvW1sfQ/MrpMzLSsjcM50POP+P0EjKPSPC/Z/MUuBcgBViCugtOlgt3XnIED4U/9HzUldHHYEBapK5+0xzaIFkDRGaoQJJ2p3UHvaBg1sjoxU/sNTI2NaISRGqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=e/5T4qg1; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58GGwTPI815989
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 16 Sep 2025 09:58:30 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58GGwTPI815989
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1758041910;
	bh=o20ydrli1a71Y2LyCeucMd1nn0RzeMH6UuH+Wr36AvA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=e/5T4qg1ptjL0J+wdQFZ3JiopdV6y6vj3+eHGQ7kM3CCG6cliG6fseSQboicm+5np
	 UiThTx/9Vo5U6jHv4Dm07F1tXsH5V5w/N6DHrt1nPATQmdDyEVDlivrRUls0f9vEcy
	 amMBbaFAPOyZy4+An88JQoHmT/lvMuJqKR2kB7TeH1vazqYePS1irhyKjutVaNtAIu
	 z7m/0M3Sbs4N0qe9JAnUjsGvELLFyhGWAawkxV5BiA/g0+5NlLp9CbDQjoUUdvaYT2
	 NQmzVUeKDnb5Bz9MPc8i2vA0nbAqi/+cXESlch7fzjIniykMxz90Ae9tUQ6G4dGeI5
	 huh1i69EBqikA==
Date: Tue, 16 Sep 2025 09:58:27 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Luck, Tony" <tony.luck@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Jiri Kosina <jkosina@suse.com>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: =?US-ASCII?Q?RE=3A_=5BMAINTAINERS_SUMMIT=5D_Annotating?=
 =?US-ASCII?Q?_patches_containing_AI-assisted_code?=
User-Agent: K-9 Mail for Android
In-Reply-To: <SJ1PR11MB6083E6C14032E7F2FBA7B654FC14A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz> <202509151019.CD7AA0C0BE@keescook> <20250916102022.5bc75a36@gandalf.local.home> <n3w52sm6d2gvbdhk34lamj52ihnspz5d2wgh4ojycr47rpvio5@ilamyahjnlmz> <20250916114820.45623213@batman.local.home> <SJ1PR11MB6083E6C14032E7F2FBA7B654FC14A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Message-ID: <30D8CB7A-A5DD-4DEE-8661-0310B628B3ED@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 16, 2025 9:06:01 AM PDT, "Luck, Tony" <tony=2Eluck@intel=2Ecom=
> wrote:
>> Perhaps we need a way to say "Hey, AI, give me a sort routine that is
>> compatible with the GPLv2 license" and then hope that it actually gives
>> you that! ;-)
>
>Current generation AI just gives output that looks like an answer to the
>prompt=2E So, in this case it might just slap
>
>// SPDX-License-Identifier: GPL-2=2E0-only
>
>on the output and call itself successful=2E
>
>If you want to be sure, you'd have to pay to train an AI model
>specifically on just GPL code and use that rather than some
>generic AI model trained on everything that could be scraped=2E
>
>-Tony
>
>

Now repeat that for every license subset that someone cares about=2E This =
is something that AI clearly doesn't hold a candle to humans yet: the abili=
ty to know what they don't know, and the ability to know what they *shouldn=
't* know in a particular context=2E

