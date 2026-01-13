Return-Path: <ksummit+bounces-2775-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D748D1B56E
	for <lists@lfdr.de>; Tue, 13 Jan 2026 22:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8699D303E43C
	for <lists@lfdr.de>; Tue, 13 Jan 2026 21:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF089320A1D;
	Tue, 13 Jan 2026 21:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NX8pP7mv"
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66124A05D
	for <ksummit@lists.linux.dev>; Tue, 13 Jan 2026 21:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768338220; cv=none; b=VWpiupl/Ikd2ihH4NN5C3dVEKQrV+hLtpcboOoDNq7yqB54rwJzkxRSZpj+zO2M7EPG5pTLWCXyXS6eH+setmzy92mhHQ271+hNXOaPtXOhUH0jpJl/2oil3eCFg5ay57KdiolABvw5yX6VDA1PxIig/bwtcYmQjgjWMpvKPveg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768338220; c=relaxed/simple;
	bh=IrPeUxe6Cqy6zzxed5sNg7QDoTLEW3bz2ePDNFWeWsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLbnenCs01/S94UzLRuNobzOlYjgZ1sXAUJ1Sr4sYq9qOe9Sx3t3IRd8Of0cM1t6uPTvRhvHKZ7KcBOx9RnVyJtBB8W97G+k6h6TqGmgKiXsXOzlkTAuglsW/+V0AQ1DrJh3LWPe9E/1rQukbpwyAGLhU5yaI205PWKx4BVlmV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NX8pP7mv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso1320705e9.1
        for <ksummit@lists.linux.dev>; Tue, 13 Jan 2026 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768338217; x=1768943017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrPeUxe6Cqy6zzxed5sNg7QDoTLEW3bz2ePDNFWeWsw=;
        b=NX8pP7mvUiedzKdt/PIphwdc4WhlizjGI+x7Hdppoaox5AoIRyESxkN3+5MLARzyy8
         oXwgLPlL/v8uuln2WqkrUF2CGdCFntN5/ZMQnMXIL+mFP/BUx0uwjUOL5RfuzIBoAjPM
         TQjsHN1Bwrl2A44WfEqQnmfRbmiJSrgZEECl+wZ7KGxg86Rf3NWJqs64PyL9U6ra6SAC
         8y73mbPR3dp1o5Zkbbi2vj9+xJgvZ4ORbuIOp7Tq2Q3jpNtE2I/LElTzlnegbXiYR3u9
         9qeDKAKKZzJD/2OZfAaex/YfewN6aYxlvTv4a2QwIx5xqN8q9x9r1X2wauOPtkz2VOau
         vSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768338217; x=1768943017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrPeUxe6Cqy6zzxed5sNg7QDoTLEW3bz2ePDNFWeWsw=;
        b=PruLSu2DW+xgMI/kA+49avfSzKkdJHsdMzSPsMTxaQQEdbMeLsXaUnleVhjDbjsNjF
         LzOGJgjeIfFkItYt+4yKRUH1i8d7vtpWSk7ZwLpNwfy5L7uZW4McbO0w+NrEEPKXMAB+
         BkKV/9cUBV9lZOlHSADg26Eh2gAp6x5ZPnQ2ypZ0MeFWPBjWnMlHaOjLVb/Xc8dJfJpk
         ufPmeMsuNDhWXKzHUPTk87Jjf2FI5I4cnacMXwknFopaSLORA10pd9aor6EMqFGkBb5O
         nJhuOJOmzrqVINQ1uyLCIek5VvMvwWxP2+sQgcVwcezc1417UwISLfqelUuumzrkv2FF
         sl2A==
X-Forwarded-Encrypted: i=1; AJvYcCXaYcw/xCTKd7VOL2qgYcxOLfcYvWvfcwvyZQn5rDgHxp6F4DlnTMdXdAO3aMqbYtn3b/ztmwIY@lists.linux.dev
X-Gm-Message-State: AOJu0YziFh+EaARYsjWhKTAgin8IIZPIZs9lhJpUMlZvBWZ9+W46K15O
	D8pkYbs29t6RrVKyUAcA35BVyTlNAKAiJdeIQf2oMx7dtx0nTulBFTBPvuofaYO4sjC8TIqOA8T
	hvMGmynTSwb5QENHExA/3vrKqRBTyky0=
X-Gm-Gg: AY/fxX6pVdkRIA9BIWm50o8/udA6E0al/xR7cO7yd6tJTskp8Ny3uPMtZMBSfqC+QJd
	G/Vm2gbj+lE87UyiN8IZT+ym4THNMVw5iwTFGYaotYc7hay9a0/vA3pipcvXsyYHa2LElRt5BpO
	I2OSUYA6+ZWTAzH38bmACfBKizTsJoAcQLP0hSy9qmnKf/XkhQg/prtb7QQ8K5dgroc/NxV8YLT
	okN6rPpmR2fkyYNabiJ4biUHF4CtnpDh3wiNN9WMBN8yvmdorYPEXJkfYtYcibEcaZRIg6wmPBr
	1NZNRzINwwhw+SY/Gmi/jQjXsAb/oTSsZNXDz8A=
X-Received: by 2002:a05:600c:8b0d:b0:45d:5c71:769d with SMTP id
 5b1f17b1804b1-47ee3782a45mr4166605e9.8.1768338216903; Tue, 13 Jan 2026
 13:03:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <aWXYi35pu9IHf2eE@stanley.mountain> <69668cfc63bb1_875d1004@dwillia2-mobl4.notmuch>
 <aWaSQsl8h2wnBjzj@laps> <69669404e2bf_875d10028@dwillia2-mobl4.notmuch>
In-Reply-To: <69669404e2bf_875d10028@dwillia2-mobl4.notmuch>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 13 Jan 2026 13:03:25 -0800
X-Gm-Features: AZwV_QixSQTSA7Fud7ctoWLfr-ehOBloZ5T35wkQapYGHDFQLqI0jXvcZPR12QM
Message-ID: <CAADnVQJG-xn4dURVDt4dUVriHeFkLXnUPxA46XFOTBSi-HRGyA@mail.gmail.com>
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated content
To: Dan Williams <dan.j.williams@intel.com>
Cc: Sasha Levin <sashal@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Simon Glass <simon.glass@canonical.com>, 
	NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, 
	workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 10:51=E2=80=AFAM <dan.j.williams@intel.com> wrote:
>
> Sasha Levin wrote:
> [..]
> > With a rule like the above, 1700+ contributors would have not been able=
 to send
> > their patch in.
>
> Good point, I am not suggesting a Reviewed-by hurdle, but can see it
> reading that way. I expect that there will always be a significant class
> of contributions that will never need author trust to be accepted. Yes,
> would need to be careful not to destroy that wellspring of new
> contributors.

You brought up an excellent point and I think it should be documented
in submitting-patches.rst:
A developer "should be able to demonstrate the
ability to substantively review a contribution of similar complexity
before expecting the kernel community to engage in earnest".

In bpf and netdev communities we ask developers to participate
in code reviews and publish metrics:
https://lore.kernel.org/bpf/?q=3Ds%3A%22bpf+development+stats%22

A bit gamified rankings, but the message is clear:
want to land patches faster? participate in code reviews!
It reduces maintainers load and demonstrates that code-reviewing
developers actually understand the code, builds maintainer's trust.

