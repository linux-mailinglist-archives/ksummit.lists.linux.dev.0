Return-Path: <ksummit+bounces-2591-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C173C48F35
	for <lists@lfdr.de>; Mon, 10 Nov 2025 20:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AC58D34A479
	for <lists@lfdr.de>; Mon, 10 Nov 2025 19:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0104D3321D7;
	Mon, 10 Nov 2025 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="nLTalEjX"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6BB3321BD
	for <ksummit@lists.linux.dev>; Mon, 10 Nov 2025 19:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762802311; cv=none; b=sCLSPv2CDfIkgbNqhcc9EOrh6gQOWljNwEKPPGcAPam1+Yi9XbWYGLa0BfrluLOLcPWMCAn/aQ6amGaebiYFpduX4SPzrMXlY9TazFbl90E/r+1RUZ6dBmEMoRF5mayGz609dYLDHjkK/TnF1mNqXv/GSxy8Q2bhEB1a58GXzr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762802311; c=relaxed/simple;
	bh=bYAM3yw8ZRBCU8+Yh4X47dHaROFz4WA8NgrlVu4UA8A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=iKhVqZKN3GyBW80FD4TB1PJIMV4TMPBHetvKHZi4OyXNnC2VqrDcQ+lWbRD2iXTumZzCRF25xLzRsksLGbrzkDItTPTm5rLpWWaCIDtIMx6YAi/YGjlvblgosmYb0ge4nTa6ljIs3nBpMnKNWPeNmFjxWHh8VCapEaEhAw6FFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=fail (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=nLTalEjX reason="signature verification failed"; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5AAJIGYH3766259
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 10 Nov 2025 11:18:16 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5AAJIGYH3766259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025102301; t=1762802297;
	bh=aUOR/E9SFXZidAbja4SyNtFTFOCV5dAmx5DuE79xBeM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=nLTalEjXvdS47YLebHeNiJqUll9Z0AzYM5gTPTbX96wfAEmWb0BOCswktBDM/EyDX
	 Y6u/PBCZwmN0GfoR1aRY5f42BjTF8WddCVvnML4SA4rgWLGhp6rKckTNAGQ7OvD6v8
	 BARH8jzMALqJpwx2dHIs+/4D9zi3bchLLZmhIi3KtFakf17AtP5ZgzsBHc304Xtv27
	 55JVU0IKLQ1NIcgneUWZazP9hChShPmZE18/2SH3euQTfUCAAxuGEHw871gQba9pFn
	 NPlJFimkewfT/ZGnEahM+1ehKSJZyjlUi96c5wE7uW6tD+UBjs1sPWMeVs0EszmYkn
	 tUIHWESvli1wQ==
Date: Mon, 10 Nov 2025 11:18:13 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Christian Brauner <brauner@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dan Williams <dan.j.williams@intel.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Shuah Khan <shuah@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_=5Bv2=5D_Documentation=3A_Provid?=
 =?US-ASCII?Q?e_guidelines_for_tool-generated_content?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com> <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz> <20251110-weiht-etablieren-39e7b63ef76d@brauner> <20251110172507.GA21641@pendragon.ideasonboard.com> <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com> <aRIxYkjX7EzalSoI@kernel.org> <CAHk-=wir-u3so=9NiFgG+bWfZHakc47iNy9vZXmSNWSZ+=Ue8g@mail.gmail.com>
Message-ID: <A274AB1C-8B6B-4004-A2BC-D540260A5771@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 10, 2025 11:05:44 AM PST, Linus Torvalds <torvalds@linux-founda=
tion=2Eorg> wrote:
>On Mon, 10 Nov 2025 at 10:39, Mike Rapoport <rppt@kernel=2Eorg> wrote:
>>
>> The novelty here is that AI does not only transform the code, it can
>> generate it from scratch en masse=2E
>
>And why would that make any difference to the basic rules for us?
>
>  "Plus =C3=A7a change, plus c'est la m=C3=AAme chose"
>
>It's a change in degree, not in any fundamentals=2E
>
>                Linus
>
>

Copyright reasons, mainly=2E

