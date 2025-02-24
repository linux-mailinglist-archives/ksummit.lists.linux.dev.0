Return-Path: <ksummit+bounces-1883-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B29AEA42E08
	for <lists@lfdr.de>; Mon, 24 Feb 2025 21:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DB9C3B2981
	for <lists@lfdr.de>; Mon, 24 Feb 2025 20:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60C7248892;
	Mon, 24 Feb 2025 20:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoNILy2s"
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7373B2A0
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 20:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740429471; cv=none; b=O2itC36/YTGaHSvVigSfwyIAe7fLNmYulRDJT8jMGR2Nbs+fLjd46a7Ecdv1FkbtIXPQUY9WfplGAgm6QkztEyzZPqBAESYkjh92w8VME3osOdJtm5OcEUFmNp6YlmKnY6+Fd9GX64ds6itFE9M5g+gNSZ8HypTdJ8v5YYDrwhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740429471; c=relaxed/simple;
	bh=CSaM3CTsdB8VvBBuF2udjUi2OuNHmqw4SUCPz7jaLFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bN2dSfvbcaSHCGzBPhcI+1Iic9PNC/lzlh7f4ABGQ8feSovI1DTP6GoDfyWTHH8TvLgVT0LjjasTlrxHp3fS4sWBRXNSjMx0YeHKxH962NZxuxc2xXvTNqwJxJYD9T/zOPcBY1Br1Id2I7BmqcVWHwvu95alM6DFi4mU3T/SkZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoNILy2s; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7be8f28172dso377368085a.3
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 12:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740429468; x=1741034268; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvTahac7VoN8UIfPPDTOy2XoASsmvBZhy0HRy4LhMqE=;
        b=hoNILy2smb0UXcRmmgUu+qF3Pe6CbQgBc0HIEQW4fRdC5o6yH2wpIn1OOTB5bNReHz
         kchU54whX7mQc1Z5qR2pS0w0IiMcP4li2yqfnyUOPvlqYnUQdRZrCPJzFMJbJMJncea1
         NyrhycaV3RuqNaQexvh/poVRMPm+6N0uyHLh66bLmIZEJ1csJg4iLwB+l9M0Vg9pISSf
         C0wZHkrW57Su2x0LFoNI2jxI57CeGglr3GYqKd3yYy6TM2gdabmo9bf7rzIeN/3wq4eT
         BH0UH4WdBoz4YBMFJdVxUV4/ntpvb+ib4N89DzWlevzKYRs39bYJqxUJY9mTXfzxQPX/
         gYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740429468; x=1741034268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvTahac7VoN8UIfPPDTOy2XoASsmvBZhy0HRy4LhMqE=;
        b=wx8rTCmUG7za5CyXJi9D1PfNyOvtuipzCmVfM5Xx2eJAV2PEXtdh2rGE8pME+Qk0er
         jDdULhsMS1h+gMTpKoMNY80aaZKl0T2bmjYM9SkoSgAieOhyT1OslL38ZkgI6ZSUCjgQ
         VZgIY6bWAsq2pnca5VRMt6vI0BY728QIoXO/fISYYa8Sa0EdcJebRIGMx2S7CWWUKGwM
         ftSY0wL+ZtQkeIjIclud9cH4QRPNgdyfcN+kTrjf3ECY48zWXidM3xzTtygrMKhTLURO
         K6pGMvHsDvh7jVF9XjRTCKtsrS0xQtp07TjCQ3gbFiTQ5Z9Dokj6yBDYWYy2rdp/+ey1
         g6xg==
X-Forwarded-Encrypted: i=1; AJvYcCWYjA68FU9/5mtrTYlc2PjMi8UwqEfKCwTF4dmztdwlROtYrxk77+/fSdl4MpU+atQ0JDq6kGgu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6cqGh5UX4CsXK5NLI2fW/Lc+NDceiRcn6kGC6ztH5mekzjgfJ
	eGfGNqtbxTS9TO+hS1rlKSoZKO1jBjxl/EMT/ftOdGec0xawshc1
X-Gm-Gg: ASbGncsTb+DYIXtqj6tTiZx8bcup4TMIH5Ja6wX/mA8Svjtdngig4+ZFZDxh/sr9/YN
	UKXzar0+Mf+YAHWGgj69z5oYU0c8TCNc4YaJWgAVlarQz3px+3omruyoxqG4o6Wwa7PRriQvIuo
	voHOZH/Me6SqCTRESZRd1yrIl6IJ+HmjcWVwOPPlmibUyKSLfUw+UikZR/IDnNt7UTyFU0t9IML
	l/fia17k4gjMsZdLoUMFphk3h86VNqh5J//WO+tZAlF4iOwJcx3bGMSxaQ2peVdNHMJQ2lTqEOF
	guTz4DdRyuVzzXVWD0DNBEsklcXVYaS8H8S1oggtwqLiVtTN3iMueoEQB3Ykzl01yrvFGqOVW5Z
	eJWIxB/lkKwviOsqa
X-Google-Smtp-Source: AGHT+IFT4gDG2ylFYDoxJMqAedimzIeqWHVtIBuyFpPAl0k5SuiVG6BEh2+gKDUkXECGw8juLszw+g==
X-Received: by 2002:a05:620a:170f:b0:7c0:a5f4:4df with SMTP id af79cd13be357-7c0cef12528mr1893154985a.34.1740429468409;
        Mon, 24 Feb 2025 12:37:48 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c329852sm16364385a.72.2025.02.24.12.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 12:37:48 -0800 (PST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9E1EF1200068;
	Mon, 24 Feb 2025 15:37:47 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 24 Feb 2025 15:37:47 -0500
X-ME-Sender: <xms:m9i8Z3htkq1szULmKOCJ93b3ZDcZqF5GQYWy3ist86cWawfG9AyCwg>
    <xme:m9i8Z0CISLhmKQZwUJoNh5An7DQbWTzOxWW__l3ngPsdTmDO9zC8tI-fRBATHF7wO
    cwPFvt62hCGWM6I7A>
X-ME-Received: <xmr:m9i8Z3Hbq7NL8kTiKhzQmPEfo_tcPPwW_yXp6yW3Jvoj17jO84rclhBNWU8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepfhgvlhhiphgvrdgtohhnthhrvghrrghsse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggr
    thhiohhnrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprh
    gtphhtthhopehhtghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohephhhprges
    iiihthhorhdrtghomhdprhgtphhtthhopehkshhumhhmihhtsehlihhsthhsrdhlihhnuh
    igrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnughonhhish
    esghhmrghilhdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:m9i8Z0RhY3borjabk8JHmynQuNN9pOs47w3GYNM0zdqMjWzgx3cjQw>
    <xmx:m9i8Z0xGp5A9H-SE-jJX5OYR8HBG_lFTiI-LIBct7WSS8aMDWkznHw>
    <xmx:m9i8Z67SVxfeJlSqQCo90n5QFPATcX0yuhcXqX2at_2Lxus7QFGH2Q>
    <xmx:m9i8Z5yZsmZuS4_xuOcWgjQrM9QfxuKohipBko2pSxzAcnzIwfajBg>
    <xmx:m9i8Z0hcjhwwU-R2TUr3LvYVUDj1M_dYx0ehe_xwlVxVTUwXBqkPvWiz>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 15:37:47 -0500 (EST)
Date: Mon, 24 Feb 2025 12:37:08 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Felipe Contreras <felipe.contreras@gmail.com>
Cc: gregkh@linuxfoundation.org, airlied@gmail.com, hch@infradead.org,
	hpa@zytor.com, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org, torvalds@linux-foundation.org
Subject: Re: Rust kernel policy
Message-ID: <Z7zYdEM5TkT2LNN1@boqun-archlinux>
References: <2025021954-flaccid-pucker-f7d9@gregkh>
 <20250221051909.37478-1-felipe.contreras@gmail.com>
 <Z7gQ3kSeCf7gY1i9@Mac.home>
 <CAMP44s1Ai5qMU4yV+Rwz4cY869ZA=cxBcTf2wuaUY1oyLKUNCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMP44s1Ai5qMU4yV+Rwz4cY869ZA=cxBcTf2wuaUY1oyLKUNCg@mail.gmail.com>

On Thu, Feb 20, 2025 at 11:59:10PM -0600, Felipe Contreras wrote:
> Boqun Feng wrote:
> >
> > On Thu, Feb 20, 2025 at 11:19:09PM -0600, Felipe Contreras wrote:
> > > Greg KH wrote:
> > > > But for new code / drivers, writing them in rust where these types of
> > > > bugs just can't happen (or happen much much less) is a win for all of
> > > > us, why wouldn't we do this?
> > >
> > > *If* they can be written in Rust in the first place. You are skipping that
> > > very important precondition.
> >
> > Hmm.. there are multiple old/new drivers (not a complete list) already
> > in Rust:
> 
> That is a black swan fallacy. Just because you've seen 4 white swans
> that doesn't mean all swans are white.
> 
> > , so is there still a question that drivers can be written in Rust?
> 
> I didn't say no driver can be written Rust, I questioned whether *all*
> drivers can be written in Rust.
> 

Huh? Your previous reply is:

"*If* they can be written in Rust in the first place. You are skipping
that very important precondition."

how does that imply you questioned whether *all* drivers can be written
in Rust.

Care to explain your logic?

Regards,
Boqun

> People are operating under that assumption, but it isn't necessarily true.
> 
> -- 
> Felipe Contreras

